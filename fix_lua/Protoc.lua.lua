local string = string
local tonumber = tonumber
local setmetatable = setmetatable
local error = error
local ipairs = ipairs
local io = io
local table = table
local math = math
local assert = assert
local tostring = tostring
local type = type
local insert_tab = table.insert
local meta = function(name, t)
  t = t or {}
  t.__name = name
  t.__index = t
  return t
end
local default = function(t, k, def)
  local v = t[k]
  if not v then
    v = def or {}
    t[k] = v
  end
  return v
end
local Lexer = meta("Lexer")
do
  local escape = {
    a = "\a",
    b = "\b",
    f = "\f",
    n = "\n",
    r = "\r",
    t = "\t",
    v = "\v"
  }
  local tohex = function(x)
    return string.byte(tonumber(x, 16))
  end
  local todec = function(x)
    return string.byte(tonumber(x, 10))
  end
  local toesc = function(x)
    return escape[x] or x
  end
  
  function Lexer.new(name, src)
    local self = {
      name = name,
      src = src,
      pos = 1
    }
    return setmetatable(self, Lexer)
  end
  
  function Lexer:__call(patt, pos)
    return self.src:match(patt, pos or self.pos)
  end
  
  function Lexer:test(patt)
    self:whitespace()
    local pos = self("^" .. patt .. "%s*()")
    if not pos then
      return false
    end
    self.pos = pos
    return true
  end
  
  function Lexer:expected(patt, name)
    if not self:test(patt) then
      return self:error((name or "'" .. patt .. "'") .. " expected")
    end
    return self
  end
  
  function Lexer:pos2loc(pos)
    local linenr = 1
    pos = pos or self.pos
    for start, stop in self.src:gmatch([[
()[^
]*()
?]]) do
      if start <= pos and stop >= pos then
        return linenr, pos - start + 1
      end
      linenr = linenr + 1
    end
  end
  
  function Lexer:error(fmt, ...)
    local ln, co = self:pos2loc()
    return error(("%s:%d:%d: " .. fmt):format(self.name, ln, co, ...))
  end
  
  function Lexer:opterror(opt, msg)
    if not opt then
      return self:error(msg)
    end
    return nil
  end
  
  function Lexer:whitespace()
    local pos, c = self("^%s*()(%/?)")
    self.pos = pos
    if "" == c then
      return self
    end
    return self:comment()
  end
  
  function Lexer:comment()
    local pos = self([[
^%/%/[^
]*
?()]])
    if not pos and self("^%/%*") then
      pos = self("^%/%*.-%*%/()")
      if not pos then
        self:error("unfinished comment")
      end
    end
    if not pos then
      return self
    end
    self.pos = pos
    return self:whitespace()
  end
  
  function Lexer:line_end(opt)
    self:whitespace()
    local pos = self("^[%s;]*%s*()")
    if not pos then
      return self:opterror(opt, "';' expected")
    end
    self.pos = pos
    return pos
  end
  
  function Lexer:eof()
    self:whitespace()
    return self.pos > #self.src
  end
  
  function Lexer:keyword(kw, opt)
    self:whitespace()
    local ident, pos = self("^([%a_][%w_]*)%s*()")
    if not ident or ident ~= kw then
      return self:opterror(opt, "''" .. kw .. "\" expected")
    end
    self.pos = pos
    return kw
  end
  
  function Lexer:ident(name, opt)
    self:whitespace()
    local b, ident, pos = self("^()([%a_][%w_]*)%s*()")
    if not ident then
      return self:opterror(opt, (name or "name") .. " expected")
    end
    self.pos = pos
    return ident, b
  end
  
  function Lexer:full_ident(name, opt)
    self:whitespace()
    local b, ident, pos = self("^()([%a_][%w_.]*)%s*()")
    if not ident or ident:match("%.%.+") then
      return self:opterror(opt, (name or "name") .. " expected")
    end
    self.pos = pos
    return ident, b
  end
  
  function Lexer:integer(opt)
    self:whitespace()
    local ns, oct, hex, s, pos = self("^([+-]?)(0?)([xX]?)([0-9a-fA-F]+)%s*()")
    local n
    if "0" == oct and "" == hex then
      n = tonumber(s, 8)
    elseif "" == oct and "" == hex then
      n = tonumber(s, 10)
    elseif "0" == oct and "" ~= hex then
      n = tonumber(s, 16)
    end
    if not n then
      return self:opterror(opt, "integer expected")
    end
    self.pos = pos
    return "-" == ns and -n or n
  end
  
  function Lexer:number(opt)
    self:whitespace()
    if self:test("nan%f[%A]") then
      return 0.0 / 0.0
    elseif self:test("inf%f[%A]") then
      return 1.0 / 0.0
    end
    local ns, d1, s, d2, s2, pos = self("^([+-]?)(%.?)([0-9]+)(%.?)([0-9]*)()")
    if not ns then
      return self:opterror(opt, "floating-point number expected")
    end
    local es, pos2 = self("(^[eE][+-]?[0-9]+)%s*()", pos)
    if "." == d1 and "." == d2 then
      return self:error("malformed floating-point number")
    end
    self.pos = pos2 or pos
    local n = tonumber(d1 .. s .. d2 .. s2 .. (es or ""))
    return "-" == ns and -n or n
  end
  
  function Lexer:quote(opt)
    self:whitespace()
    local q, start = self("^([\"'])()")
    if not start then
      return self:opterror(opt, "string expected")
    end
    self.pos = start
    local patt = "()(\\?" .. q .. ")%s*()"
    while true do
      local stop, s, pos = self(patt)
      if not stop then
        self.pos = start - 1
        return self:error("unfinished string")
      end
      self.pos = pos
      if s == q then
        return self.src:sub(start, stop - 1):gsub("\\x(%x+)", tohex):gsub("\\(%d+)", todec):gsub("\\(.)", toesc)
      end
    end
  end
  
  function Lexer:structure(opt)
    self:whitespace()
    if not self:test("{") then
      return self:opterror(opt, "opening curly brace expected")
    end
    local t = {}
    while not self:test("}") do
      local ident = self:full_ident("field name")
      self:test(":")
      local value = self:constant()
      self:test(",")
      self:line_end("opt")
      t[ident] = value
    end
    return t
  end
  
  function Lexer:array(opt)
    self:whitespace()
    if not self:test("%[") then
      return self:opterror(opt, "opening square bracket expected")
    end
    local t = {}
    while not self:test("]") do
      local value = self:constant()
      self:test(",")
      t[#t + 1] = value
    end
    return t
  end
  
  function Lexer:constant(opt)
    local c = self:full_ident("constant", "opt") or self:number("opt") or self:quote("opt") or self:structure("opt") or self:array("opt")
    if not c and not opt then
      return self:error("constant expected")
    end
    return c
  end
  
  function Lexer:option_name()
    local ident
    if self:test("%(") then
      ident = self:full_ident("option name")
      self:expected("%)")
    else
      ident = self:ident("option name")
    end
    while self:test("%.") do
      ident = ident .. "." .. self:ident()
    end
    return ident
  end
  
  function Lexer:type_name()
    if self:test("%.") then
      local id, pos = self:full_ident("type name")
      return "." .. id, pos
    else
      return self:full_ident("type name")
    end
  end
end
local Parser = meta("Parser")
Parser.typemap = {}
Parser.loaded = {}
Parser.paths = {"", "."}

function Parser.new()
  local self = {}
  self.typemap = {}
  self.loaded = {}
  self.paths = {"", "."}
  return setmetatable(self, Parser)
end

function Parser:error(msg)
  return self.lex:error(msg)
end

function Parser:addpath(path)
  insert_tab(self.paths, path)
end

function Parser:parsefile(name)
  local info = self.loaded[name]
  if info then
    return info
  end
  local errors = {}
  for _, path in ipairs(self.paths) do
    local fn = "" ~= path and path .. "/" .. name or name
    local fh, err = io.open(fn)
    if fh then
      local content = fh:read("*a")
      info = self:parse(content, name)
      fh:close()
      return info
    end
    insert_tab(errors, err or fn .. ": " .. "unknown error")
  end
  if self.import_fallback then
    info = self.import_fallback(name)
  end
  if not info then
    error("module load error: " .. name .. [[

	]] .. table.concat(errors, [[

	]]))
  end
  return info
end

do
  local labels = {
    optional = 1,
    required = 2,
    repeated = 3
  }
  local key_types = {
    int32 = 5,
    int64 = 3,
    uint32 = 13,
    uint64 = 4,
    sint32 = 17,
    sint64 = 18,
    fixed32 = 7,
    fixed64 = 6,
    sfixed32 = 15,
    sfixed64 = 16,
    bool = 8,
    string = 9
  }
  local com_types = {
    group = 10,
    message = 11,
    enum = 14
  }
  local types = {
    double = 1,
    float = 2,
    int32 = 5,
    int64 = 3,
    uint32 = 13,
    uint64 = 4,
    sint32 = 17,
    sint64 = 18,
    fixed32 = 7,
    fixed64 = 6,
    sfixed32 = 15,
    sfixed64 = 16,
    bool = 8,
    string = 9,
    bytes = 12,
    group = 10,
    message = 11,
    enum = 14
  }
  local register_type = function(self, lex, tname, typ)
    if not tname:match("%.") then
      tname = self.prefix .. tname
    end
    if self.typemap[tname] then
      return lex:error("type %s already defined", tname)
    end
    self.typemap[tname] = typ
  end
  local type_info = function(lex, tname)
    local tenum = types[tname]
    if com_types[tname] then
      return lex:error("invalid type name: " .. tname)
    elseif tenum then
      tname = nil
    end
    return tenum, tname
  end
  local map_info = function(lex)
    local keyt = lex:ident("key type")
    if not key_types[keyt] then
      return lex:error("invalid key type: " .. keyt)
    end
    local valt = lex:expected(","):type_name()
    local name = lex:expected(">"):ident()
    local ident = name:gsub("^%a", string.upper):gsub("_(%a)", string.upper) .. "Entry"
    local kt, ktn = type_info(lex, keyt)
    local vt, vtn = type_info(lex, valt)
    return name, types.message, ident, {
      name = ident,
      field = {
        {
          name = "key",
          number = 1,
          label = labels.optional,
          type = kt,
          type_name = ktn
        },
        {
          name = "value",
          number = 2,
          label = labels.optional,
          type = vt,
          type_name = vtn
        }
      },
      options = {map_entry = true}
    }
  end
  local inline_option = function(lex, info)
    if lex:test("%[") then
      info = info or {}
      while true do
        local name = lex:option_name()
        local value = lex:expected("="):constant()
        info[name] = value
        if lex:test("%]") then
          return info
        end
        lex:expected(",")
      end
    end
  end
  local field = function(self, lex, ident)
    local name, typ, type_name, map_entry
    if "map" == ident and lex:test("%<") then
      name, typ, type_name, map_entry = map_info(lex)
      self.locmap[map_entry.field[1]] = lex.pos
      self.locmap[map_entry.field[2]] = lex.pos
      register_type(self, lex, type_name, types.message)
    else
      typ, type_name = type_info(lex, ident)
      name = lex:ident()
    end
    local info = {
      name = name,
      number = lex:expected("="):integer(),
      label = "map" == ident and labels.repeated or labels.optional,
      type = typ,
      type_name = type_name
    }
    local options = inline_option(lex)
    if options then
      info.default_value, options.default = tostring(options.default), nil
      info.json_name, options.json_name = options.json_name, nil
      if options.packed and options.packed == "false" then
        options.packed = false
      end
    end
    info.options = options
    if info.number <= 0 then
      lex:error("invalid tag number: " .. info.number)
    end
    return info, map_entry
  end
  local label_field = function(self, lex, ident)
    local label = labels[ident]
    local info, map_entry
    if not label then
      if self.syntax == "proto2" and "map" ~= ident then
        return lex:error("proto2 disallow missing label")
      end
      return field(self, lex, ident)
    end
    if label == labels.optional and self.syntax == "proto3" then
      return lex:error("proto3 disallow 'optional' label")
    end
    info, map_entry = field(self, lex, lex:type_name())
    info.label = label
    return info, map_entry
  end
  local toplevel = {}
  
  function toplevel:package(lex, info)
    local package = lex:full_ident("package name")
    lex:line_end()
    info.package = package
    self.prefix = "." .. package .. "."
    return self
  end
  
  function toplevel:import(lex, info)
    local mode = lex:ident("\"weak\" or \"public\"", "opt") or "public"
    if "weak" ~= mode and "public" ~= mode then
      return lex:error("\"weak or \"public\" expected")
    end
    local name = lex:quote()
    lex:line_end()
    local result = self:parsefile(name)
    if self.on_import then
      self.on_import(result)
    end
    local dep = default(info, "dependency")
    local index = #dep
    dep[index + 1] = name
    if "public" == mode then
      local it = default(info, "public_dependency")
      insert_tab(it, index)
    else
      local it = default(info, "weak_dependency")
      insert_tab(it, index)
    end
  end
  
  do
    local msg_body = {}
    
    function msg_body:message(lex, info)
      local nested_type = default(info, "nested_type")
      insert_tab(nested_type, toplevel.message(self, lex))
      return self
    end
    
    function msg_body:enum(lex, info)
      local nested_type = default(info, "enum_type")
      insert_tab(nested_type, toplevel.enum(self, lex))
      return self
    end
    
    function msg_body:extend(lex, info)
      local extension = default(info, "extension")
      local nested_type = default(info, "nested_type")
      local ft, mt = toplevel.extend(self, lex, {})
      for _, v in ipairs(ft) do
        insert_tab(extension, v)
      end
      for _, v in ipairs(mt) do
        insert_tab(nested_type, v)
      end
      return self
    end
    
    function msg_body:extensions(lex, info)
      local rt = default(info, "extension_range")
      repeat
        local start = lex:integer("field number range")
        local stop = math.floor(5.36870912E8)
        lex:keyword("to")
        if not lex:keyword("max", "opt") then
          stop = lex:integer("field number range end or 'max'")
        end
        insert_tab(rt, {
          start = start,
          ["end"] = stop
        })
      until not lex:test(",")
      lex:line_end()
      return self
    end
    
    function msg_body:reserved(lex, info)
      lex:whitespace()
      if not lex("^%d") then
        local rt = default(info, "reserved_name")
        repeat
          insert_tab(rt, (lex:quote()))
        until not lex:test(",")
      else
        local rt = default(info, "reserved_range")
        local first = true
        repeat
          local start = lex:integer(first and "field name or number range" or "field number range")
          if lex:keyword("to", "opt") then
            local stop = lex:integer("field number range end")
            insert_tab(rt, {
              start = start,
              ["end"] = stop
            })
          else
            insert_tab(rt, {
              start = start,
              ["end"] = start
            })
          end
          first = false
        until not lex:test(",")
      end
      lex:line_end()
      return self
    end
    
    function msg_body:oneof(lex, info)
      local fs = default(info, "field")
      local ts = default(info, "nested_type")
      local ot = default(info, "oneof_decl")
      local index = #ot + 1
      local oneof = {
        name = lex:ident()
      }
      lex:expected("{")
      while not lex:test("}") do
        local ident = lex:type_name()
        if "option" == ident then
          toplevel.option(self, lex, oneof)
        else
          local f, t = field(self, lex, ident, "no_label")
          self.locmap[f] = lex.pos
          if t then
            insert_tab(ts, t)
          end
          f.oneof_index = index - 1
          insert_tab(fs, f)
        end
        lex:line_end("opt")
      end
      ot[index] = oneof
    end
    
    function msg_body:option(lex, info)
      toplevel.option(self, lex, default(info, "options"))
    end
    
    function toplevel:message(lex, info)
      local name = lex:ident("message name")
      local typ = {name = name}
      register_type(self, lex, name, types.message)
      local prefix = self.prefix
      self.prefix = prefix .. name .. "."
      lex:expected("{")
      while not lex:test("}") do
        local ident, pos = lex:type_name()
        local body_parser = msg_body[ident]
        if body_parser then
          body_parser(self, lex, typ)
        else
          local fs = default(typ, "field")
          local f, t = label_field(self, lex, ident)
          self.locmap[f] = pos
          insert_tab(fs, f)
          if t then
            local ts = default(typ, "nested_type")
            insert_tab(ts, t)
          end
        end
        lex:line_end("opt")
      end
      lex:line_end("opt")
      if info then
        info = default(info, "message_type")
        insert_tab(info, typ)
      end
      self.prefix = prefix
      return typ
    end
    
    function toplevel:enum(lex, info)
      local name = lex:ident("enum name")
      local enum = {name = name}
      register_type(self, lex, name, types.enum)
      lex:expected("{")
      while not lex:test("}") do
        local ident = lex:ident("enum constant name")
        if "option" == ident then
          toplevel.option(self, lex, default(enum, "options"))
        else
          local values = default(enum, "value")
          local number = lex:expected("="):integer()
          lex:line_end()
          insert_tab(values, {
            name = ident,
            number = number,
            options = inline_option(lex)
          })
        end
        lex:line_end("opt")
      end
      lex:line_end("opt")
      if info then
        info = default(info, "enum_type")
        insert_tab(info, enum)
      end
      return enum
    end
    
    function toplevel:option(lex, info)
      local ident = lex:option_name()
      lex:expected("=")
      local value = lex:constant()
      lex:line_end()
      local options = info and default(info, "options") or {}
      options[ident] = value
      return options, self
    end
    
    function toplevel:extend(lex, info)
      local name = lex:type_name()
      local ft = info and default(info, "extension") or {}
      local mt = info and default(info, "message_type") or {}
      lex:expected("{")
      while not lex:test("}") do
        local ident, pos = lex:type_name()
        local f, t = label_field(self, lex, ident)
        self.locmap[f] = pos
        f.extendee = name
        insert_tab(ft, f)
        insert_tab(mt, t)
        lex:line_end("opt")
      end
      return ft, mt
    end
    
    local svr_body = {}
    
    function svr_body:rpc(lex, info)
      local name, pos = lex:ident("rpc name")
      local rpc = {name = name}
      self.locmap[rpc] = pos
      local _, tn
      lex:expected("%(")
      rpc.client_streaming = lex:keyword("stream", "opt")
      _, tn = type_info(lex, lex:type_name())
      if not tn then
        return lex:error("rpc input type must by message")
      end
      rpc.input_type = tn
      lex:expected("%)"):expected("returns"):expected("%(")
      rpc.server_streaming = lex:keyword("stream", "opt")
      _, tn = type_info(lex, lex:type_name())
      if not tn then
        return lex:error("rpc output type must by message")
      end
      rpc.output_type = tn
      lex:expected("%)")
      if lex:test("{") then
        while not lex:test("}") do
          lex:line_end("opt")
          lex:keyword("option")
          toplevel.option(self, lex, default(rpc, "options"))
        end
      end
      lex:line_end("opt")
      local t = default(info, "method")
      insert_tab(t, rpc)
    end
    
    function svr_body:option(lex, info)
      toplevel.option(self, lex, default(info, "options"))
    end
    
    function svr_body.stream(_, lex)
      lex:error("stream not implement yet")
    end
    
    function toplevel:service(lex, info)
      local name = lex:ident("service name")
      local svr = {name = name}
      lex:expected("{")
      while not lex:test("}") do
        local ident = lex:type_name()
        local body_parser = svr_body[ident]
        if body_parser then
          body_parser(self, lex, svr)
        else
          return lex:error("expected 'rpc' or 'option' in service body")
        end
        lex:line_end("opt")
      end
      lex:line_end("opt")
      if info then
        info = default(info, "service")
        insert_tab(info, svr)
      end
      return svr
    end
  end
  local make_context = function(self, lex)
    local ctx = {
      syntax = "proto2",
      locmap = {},
      prefix = ".",
      lex = lex,
      parser = self
    }
    ctx.loaded = self.loaded
    ctx.typemap = self.typemap
    ctx.paths = self.paths
    
    function ctx.import_fallback(import_name)
      if self.unknown_import == true then
        return true
      elseif type(self.unknown_import) == "string" then
        return import_name:match(self.unknown_import) and true or nil
      elseif self.unknown_import then
        return self:unknown_import(import_name)
      end
    end
    
    function ctx.type_fallback(type_name)
      if self.unknown_type == true then
        return true
      elseif type(self.unknown_type) == "string" then
        return type_name:match(self.unknown_type) and true
      elseif self.unknown_type then
        return self:unknown_type(type_name)
      end
    end
    
    function ctx.on_import(info)
      if self.on_import then
        return self.on_import(info)
      end
    end
    
    return setmetatable(ctx, Parser)
  end
  
  function Parser:parse(src, name)
    local loaded = self.loaded[name]
    if loaded then
      if true == loaded then
        error("loop loaded: " .. name)
      end
      return loaded
    end
    name = name or "<input>"
    self.loaded[name] = true
    local lex = Lexer.new(name, src)
    local ctx = make_context(self, lex)
    local info = {
      name = lex.name,
      syntax = ctx.syntax
    }
    local syntax = lex:keyword("syntax", "opt")
    if syntax then
      info.syntax = lex:expected("="):quote()
      ctx.syntax = info.syntax
      lex:line_end()
    end
    while not lex:eof() do
      local ident = lex:ident()
      local top_parser = toplevel[ident]
      if top_parser then
        top_parser(ctx, lex, info)
      else
        lex:error("unknown keyword '" .. ident .. "'")
      end
      lex:line_end("opt")
    end
    self.loaded[name] = "<input>" ~= name and info or nil
    return ctx:resolve(lex, info)
  end
  
  local empty = function()
  end
  local iter = function(t, k)
    local v = t[k]
    if v then
      return ipairs(v)
    end
    return empty
  end
  local check_dup = function(self, lex, typ, map, k, v)
    local old = map[v[k]]
    if old then
      local ln, co = lex:pos2loc(self.locmap[old])
      lex:error("%s '%s' exists, previous at %d:%d", typ, v[k], ln, co)
    end
    map[v[k]] = v
  end
  local check_type = function(self, lex, tname)
    if tname:match("^%.") then
      local t = self.typemap[tname]
      if not t then
        return lex:error("unknown type '%s'", tname)
      end
      return t, tname
    end
    local prefix = self.prefix
    for i = #prefix + 1, 1, -1 do
      local op = prefix[i]
      prefix[i] = tname
      local tn = table.concat(prefix, ".", 1, i)
      prefix[i] = op
      local t = self.typemap[tn]
      if t then
        return t, tn
      end
    end
    local tn, t
    if self.type_fallback then
      tn, t = self.type_fallback(tname)
    end
    if tn then
      t = types[t or "message"]
      if true == tn then
        tn = "." .. tname
      end
      return t, tn
    end
    return lex:error("unknown type '%s'", tname)
  end
  local check_field = function(self, lex, info)
    if info.extendee then
      local t, tn = check_type(self, lex, info.extendee)
      if t ~= types.message then
        lex:error("message type expected in extension")
      end
      info.extendee = tn
    end
    if info.type_name then
      local t, tn = check_type(self, lex, info.type_name)
      info.type = t
      info.type_name = tn
    end
  end
  local check_enum = function(self, lex, info)
    local names, numbers = {}, {}
    for _, v in iter(info, "value") do
      lex.pos = self.locmap[v]
      check_dup(self, lex, "enum name", names, "name", v)
      if not (info.options and info.options.options) or not info.options.options.allow_alias then
        check_dup(self, lex, "enum number", numbers, "number", v)
      end
    end
  end
  
  local function check_message(self, lex, info)
    insert_tab(self.prefix, info.name)
    local names, numbers = {}, {}
    for _, v in iter(info, "field") do
      lex.pos = assert(self.locmap[v])
      check_dup(self, lex, "field name", names, "name", v)
      check_dup(self, lex, "field number", numbers, "number", v)
      check_field(self, lex, v)
    end
    for _, v in iter(info, "nested_type") do
      check_message(self, lex, v)
    end
    for _, v in iter(info, "extension") do
      lex.pos = assert(self.locmap[v])
      check_field(self, lex, v)
    end
    self.prefix[#self.prefix] = nil
  end
  
  local check_service = function(self, lex, info)
    local names = {}
    for _, v in iter(info, "method") do
      lex.pos = self.locmap[v]
      check_dup(self, lex, "rpc name", names, "name", v)
      local t, tn = check_type(self, lex, v.input_type)
      v.input_type = tn
      if t ~= types.message then
        lex:error("message type expected in parameter")
      end
      t, tn = check_type(self, lex, v.output_type)
      v.output_type = tn
      if t ~= types.message then
        lex:error("message type expected in return")
      end
    end
  end
  
  function Parser:resolve(lex, info)
    self.prefix = {
      "",
      info.package
    }
    for _, v in iter(info, "message_type") do
      check_message(self, lex, v)
    end
    for _, v in iter(info, "enum_type") do
      check_enum(self, lex, v)
    end
    for _, v in iter(info, "service") do
      check_service(self, lex, v)
    end
    for _, v in iter(info, "extension") do
      lex.pos = assert(self.locmap[v])
      check_field(self, lex, v)
    end
    self.prefix = nil
    return info
  end
end
local has_pb, pb = pcall(require, "pb")
if has_pb then
  local descriptor_pb = "\n\249#\ndescriptor.protogoogle.protobuf\"G\nFileDescript" .. "orSet2\nfile (\v2$.google.protobuf.FileDescriptorProto\"" .. "\219\003\nFileDescriptorProto\f\nname (\t\n\apack" .. "age (\t\n\ndependency (\t\npublic_depend" .. "ency\n (\nweak_dependency\v (6\n\fmessag" .. "e_type (\v2 .google.protobuf.DescriptorProto7\n\tenum_type" .. " (\v2$.google.protobuf.EnumDescriptorProto8\n\aservice" .. " (\v2'.google.protobuf.ServiceDescriptorProto8\n\textension" .. "\a (\v2%.google.protobuf.FieldDescriptorProto-\n\aoptions" .. "\b (\v2.google.protobuf.FileOptions9\nsource_code_info" .. "\t (\v2.google.protobuf.SourceCodeInfo\nsyntax\f (" .. "\t\"\228\003\nDescriptorProto\f\nname (\t4\nfield" .. " (\v2%.google.protobuf.FieldDescriptorProto8\n\textension" .. " (\v2%.google.protobuf.FieldDescriptorProto5\n\vnested_ty" .. "pe (\v2 .google.protobuf.DescriptorProto7\n\tenum_type" .. " (\v2$.google.protobuf.EnumDescriptorProtoH\nextension_rang" .. "e (\v2/.google.protobuf.DescriptorProto.ExtensionRange9\n" .. "\noneof_decl\b (\v2%.google.protobuf.OneofDescriptorProto0" .. "\n\aoptions\a (\v2.google.protobuf.MessageOptions,\nEx" .. "tensionRange\r\nstart (\v\nend (\"\169\005" .. "\nFieldDescriptorProto\f\nname (\t\nnumber" .. " (:\nlabel (2+.google.protobuf.FieldDescriptorPro" .. "to.Label8\ntype (2*.google.protobuf.FieldDescriptorPro" .. "to.Type\n\ttype_name (\t\n\bextendee (\t" .. "\n\rdefault_value\a (\t\n\voneof_index\t (." .. "\n\aoptions\b (\v2.google.protobuf.FieldOptions\"\182\002\nT" .. "ype\n\vTYPE_DOUBLE\n\nTYPE_FLOAT\n\nTY" .. "PE_INT64\n\vTYPE_UINT64\n\nTYPE_INT32" .. "\n\fTYPE_FIXED64\n\fTYPE_FIXED32\a\r\n\tTYPE_B" .. "OOL\b\n\vTYPE_STRING\t\n\nTYPE_GROUP\n" .. "\n\fTYPE_MESSAGE\v\n\nTYPE_BYTES\f\n\vTYPE_UIN" .. "T32\r\r\n\tTYPE_ENUM\n\rTYPE_SFIXED32" .. "\n\rTYPE_SFIXED64\n\vTYPE_SINT32\n\vTYPE_S" .. "INT64\"C\nLabel\nLABEL_OPTIONAL\nLABEL" .. "_REQUIRED\nLABEL_REPEATED\"$\nOneofDescriptorPro" .. "to\f\nname (\t\"\140\001\nEnumDescriptorProto\f\n" .. "name (\t8\nvalue (\v2).google.protobuf.EnumValueD" .. "escriptorProto-\n\aoptions (\v2.google.protobuf.EnumOpti" .. "ons\"l\nEnumValueDescriptorProto\f\nname (\t\n" .. "number (2\n\aoptions (\v2!.google.protobuf.Enum" .. "ValueOptions\"\144\001\nServiceDescriptorProto\f\nname (" .. "\t6\nmethod (\v2&.google.protobuf.MethodDescriptorProto" .. "0\n\aoptions (\v2.google.protobuf.ServiceOptions\"\193" .. "\nMethodDescriptorProto\f\nname (\t\n\ninput" .. "_type (\t\n\voutput_type (\t/\n\aoptions " .. "(\v2.google.protobuf.MethodOptions\nclient_streaming" .. " (\b:false\nserver_streaming (\b:false\"\231\004" .. "\n\vFileOptions\n\fjava_package (\t\njava_out" .. "er_classname\b (\t\"\njava_multiple_files\n (\b:fals" .. "e,\njava_generate_equals_and_hash (\b:false%\nja" .. "va_string_check_utf8 (\b:falseF\n\foptimize_for\t (" .. "2).google.protobuf.FileOptions.OptimizeMode:SPEED\n\ngo_pa" .. "ckage\v (\t\"\ncc_generic_services (\b:false$" .. "\njava_generic_services (\b:false\"\npy_generic_ser" .. "vices (\b:false\n\ndeprecated (\b:false" .. "\ncc_enable_arenas (\b:false\nobjc_class_pref" .. "ix$ (\tC\nuninterpreted_option\024\231\a (\v2$.google.pro" .. "tobuf.UninterpretedOption\":\n\fOptimizeMode\t\nSPEED\r" .. "\n\tCODE_SIZE\n\fLITE_RUNTIME*\t\b\232\a\016\128\128" .. "\128\128\002\"\230\001\nMessageOptions&\nmessage_set_wire_format" .. " (\b:false.\nno_standard_descriptor_accessor (\b:" .. "false\n\ndeprecated (\b:false\n\tmap_entry" .. "\a (\bC\nuninterpreted_option\024\231\a (\v2$.google.protobu" .. "f.UninterpretedOption*\t\b\232\a\016\128\128\128\128\002\"\160\002\n\fField" .. "Options:\nctype (2#.google.protobuf.FieldOptions.CType:" .. "STRING\npacked (\b\nlazy (\b:false" .. "\n\ndeprecated (\b:false\nweak\n (\b:f" .. "alseC\nuninterpreted_option\024\231\a (\v2$.google.protobuf.Un" .. "interpretedOption\"/\nCType\n\nSTRING \b\nCORD" .. "\n\fSTRING_PIECE*\t\b\232\a\016\128\128\128\128\002\"\141\001\n" .. "\vEnumOptions\n\vallow_alias (\b\n\ndeprecated" .. " (\b:falseC\nuninterpreted_option\024\231\a (\v2$.goo" .. "gle.protobuf.UninterpretedOption*\t\b\232\a\016\128\128\128\128\002\"}\n" .. "EnumValueOptions\n\ndeprecated (\b:falseC\nun" .. "interpreted_option\024\231\a (\v2$.google.protobuf.UninterpretedOptio" .. "n*\t\b\232\a\016\128\128\128\128\002\"{\nServiceOptions\n\ndepr" .. "ecated! (\b:falseC\nuninterpreted_option\024\231\a (\v2" .. "$.google.protobuf.UninterpretedOption*\t\b\232\a\016\128\128\128\128\002\"z" .. "\n\rMethodOptions\n\ndeprecated! (\b:falseC\nuni" .. "nterpreted_option\024\231\a (\v2$.google.protobuf.UninterpretedOption" .. "*\t\b\232\a\016\128\128\128\128\002\"\158\002\nUninterpretedOption;\n" .. "name (\v2-.google.protobuf.UninterpretedOption.NamePart" .. "\nidentifier_value (\t\npositive_int_value (" .. "\nnegative_int_value (\n\fdouble_value" .. " (\n\fstring_value\a (\f\naggregate_value" .. "\b (\t3\n\bNamePart\n\tname_part (\t\n\f" .. "is_extension (\b\"\213\001\nSourceCodeInfo:\n\blocation" .. " (\v2(.google.protobuf.SourceCodeInfo.Location\026\134\001\n\bLocati" .. "on\npath (B\nspan (B" .. "\nleading_comments (\t\ntrailing_comments" .. " (\t!\nleading_detached_comments (\tB)\ncom.google" .. ".protobufBDescriptorProtosH"
  
  function Parser.reload()
    assert(pb.load(descriptor_pb), "load descriptor msg failed")
  end
  
  local do_compile = function(self, f, ...)
    if self.include_imports then
      local old = self.on_import
      local infos = {}
      
      function self.on_import(info)
        insert_tab(infos, info)
      end
      
      local r = f(...)
      insert_tab(infos, r)
      self.on_import = old
      return {file = infos}
    end
    return {
      file = {
        f(...)
      }
    }
  end
  
  function Parser:compile(s, name)
    if self == Parser then
      self = Parser.new()
    end
    local set = do_compile(self, self.parse, self, s, name)
    return pb.encode(".google.protobuf.FileDescriptorSet", set)
  end
  
  function Parser:compilefile(fn)
    if self == Parser then
      self = Parser.new()
    end
    local set = do_compile(self, self.parsefile, self, fn)
    return pb.encode(".google.protobuf.FileDescriptorSet", set)
  end
  
  function Parser:load(s, name)
    if self == Parser then
      self = Parser.new()
    end
    local ret, pos = pb.load(self:compile(s, name))
    if ret then
      return ret, pos
    end
    error("load failed at offset " .. pos)
  end
  
  function Parser:loadfile(fn)
    if self == Parser then
      self = Parser.new()
    end
    local ret, pos = pb.load(self:compilefile(fn))
    if ret then
      return ret, pos
    end
    error("load failed at offset " .. pos)
  end
  
  Parser.reload()
end
return Parser
