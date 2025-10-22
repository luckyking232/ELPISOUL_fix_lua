local math = require("math")
local string = require("string")
local table = require("table")
local json = {}
local json_private = {}
json.EMPTY_ARRAY = {}
json.EMPTY_OBJECT = {}
local decode_scanArray, decode_scanComment, decode_scanConstant, decode_scanNumber, decode_scanObject, decode_scanString, decode_scanWhitespace, isArray, isEncodable

function json.encode(v)
  if nil == v then
    return "null"
  end
  local vtype = type(v)
  if "string" == vtype then
    return "\"" .. json_private.encodeString(v) .. "\""
  end
  if "number" == vtype or "boolean" == vtype then
    return tostring(v)
  end
  if "table" == vtype then
    local rval = {}
    local bArray, maxCount = isArray(v)
    if bArray then
      for i = 1, maxCount do
        table.insert(rval, json.encode(v[i]))
      end
    else
      for i, j in pairs(v) do
        if isEncodable(i) and isEncodable(j) then
          table.insert(rval, "\"" .. json_private.encodeString(i) .. "\":" .. json.encode(j))
        end
      end
    end
    if bArray then
      return "[" .. table.concat(rval, ",") .. "]"
    else
      return "{" .. table.concat(rval, ",") .. "}"
    end
  end
  if "function" == vtype and v == json.null then
    return "null"
  end
  assert(false, "encode attempt to encode unsupported type " .. vtype .. ":" .. tostring(v))
end

function json.decode(s, startPos)
  startPos = startPos and startPos or 1
  startPos = decode_scanWhitespace(s, startPos)
  assert(startPos <= string.len(s), "Unterminated JSON encoded object found at position in [" .. s .. "]")
  local curChar = string.sub(s, startPos, startPos)
  if "{" == curChar then
    return decode_scanObject(s, startPos)
  end
  if "[" == curChar then
    return decode_scanArray(s, startPos)
  end
  if string.find("+-0123456789.e", curChar, 1, true) then
    return decode_scanNumber(s, startPos)
  end
  if "\"" == curChar or "'" == curChar then
    return decode_scanString(s, startPos)
  end
  if string.sub(s, startPos, startPos + 1) == "/*" then
    return json.decode(s, decode_scanComment(s, startPos))
  end
  return decode_scanConstant(s, startPos)
end

function json.null()
  return json.null
end

function decode_scanArray(s, startPos)
  local array = {}
  local stringLen = string.len(s)
  assert(string.sub(s, startPos, startPos) == "[", "decode_scanArray called but array does not start at position " .. startPos .. " in string:\n" .. s)
  startPos = startPos + 1
  local index = 1
  local object
  repeat
    startPos = decode_scanWhitespace(s, startPos)
    assert(stringLen >= startPos, "JSON String ended unexpectedly scanning array.")
    local curChar = string.sub(s, startPos, startPos)
    if "]" == curChar then
      return array, startPos + 1
    end
    if "," == curChar then
      startPos = decode_scanWhitespace(s, startPos + 1)
    end
    assert(stringLen >= startPos, "JSON String ended unexpectedly scanning array.")
    object, startPos = json.decode(s, startPos)
    array[index] = object
    index = index + 1
  until false
end

function decode_scanComment(s, startPos)
  assert(string.sub(s, startPos, startPos + 1) == "/*", "decode_scanComment called but comment does not start at position " .. startPos)
  local endPos = string.find(s, "*/", startPos + 2)
  assert(nil ~= endPos, "Unterminated comment in string at " .. startPos)
  return endPos + 2
end

function decode_scanConstant(s, startPos)
  local consts = {
    ["true"] = true,
    ["false"] = false,
    null = nil
  }
  local constNames = {
    "true",
    "false",
    "null"
  }
  for i, k in pairs(constNames) do
    if string.sub(s, startPos, startPos + string.len(k) - 1) == k then
      return consts[k], startPos + string.len(k)
    end
  end
  assert(nil, "Failed to scan constant from string " .. s .. " at starting position " .. startPos)
end

function decode_scanNumber(s, startPos)
  local endPos = startPos + 1
  local stringLen = string.len(s)
  local acceptableChars = "+-0123456789.e"
  while string.find(acceptableChars, string.sub(s, endPos, endPos), 1, true) and endPos <= stringLen do
    endPos = endPos + 1
  end
  local stringValue = "return " .. string.sub(s, startPos, endPos - 1)
  local stringEval = load(stringValue)
  assert(stringEval, "Failed to scan number [ " .. stringValue .. "] in JSON string at position " .. startPos .. " : " .. endPos)
  return stringEval(), endPos
end

function decode_scanObject(s, startPos)
  local object = {}
  local stringLen = string.len(s)
  local key, value
  assert(string.sub(s, startPos, startPos) == "{", "decode_scanObject called but object does not start at position " .. startPos .. " in string:\n" .. s)
  startPos = startPos + 1
  repeat
    startPos = decode_scanWhitespace(s, startPos)
    assert(stringLen >= startPos, "JSON string ended unexpectedly while scanning object.")
    local curChar = string.sub(s, startPos, startPos)
    if "}" == curChar then
      return object, startPos + 1
    end
    if "," == curChar then
      startPos = decode_scanWhitespace(s, startPos + 1)
    end
    assert(stringLen >= startPos, "JSON string ended unexpectedly scanning object.")
    key, startPos = json.decode(s, startPos)
    assert(stringLen >= startPos, "JSON string ended unexpectedly searching for value of key " .. key)
    startPos = decode_scanWhitespace(s, startPos)
    assert(stringLen >= startPos, "JSON string ended unexpectedly searching for value of key " .. key)
    assert(string.sub(s, startPos, startPos) == ":", "JSON object key-value assignment mal-formed at " .. startPos)
    startPos = decode_scanWhitespace(s, startPos + 1)
    assert(stringLen >= startPos, "JSON string ended unexpectedly searching for value of key " .. key)
    value, startPos = json.decode(s, startPos)
    object[key] = value
  until false
end

local escapeSequences = {
  ["\\t"] = "\t",
  ["\\f"] = "\f",
  ["\\r"] = "\r",
  ["\\n"] = "\n",
  ["\\b"] = "\b"
}
setmetatable(escapeSequences, {
  __index = function(t, k)
    return string.sub(k, 2)
  end
})

function decode_scanString(s, startPos)
  assert(startPos, "decode_scanString(..) called without start position")
  local startChar = string.sub(s, startPos, startPos)
  assert("\"" == startChar or "'" == startChar, "decode_scanString called for a non-string")
  local t = {}
  local i, j = startPos, startPos
  while string.find(s, startChar, j + 1) ~= j + 1 do
    local oldj = j
    i, j = string.find(s, "\\.", j + 1)
    local x, y = string.find(s, startChar, oldj + 1)
    if not i or i > x then
      i, j = x, y - 1
    end
    table.insert(t, string.sub(s, oldj + 1, i - 1))
    if string.sub(s, i, j) == "\\u" then
      local a = string.sub(s, j + 1, j + 4)
      j = j + 4
      local n = tonumber(a, 16)
      assert(n, "String decoding failed: bad Unicode escape " .. a .. " at position " .. i .. " : " .. j)
      local x
      if n < 128 then
        x = string.char(n % 128)
      elseif n < 2048 then
        x = string.char(192 + math.floor(n / 64) % 32, 128 + n % 64)
      else
        x = string.char(224 + math.floor(n / 4096) % 16, 128 + math.floor(n / 64) % 64, 128 + n % 64)
      end
      table.insert(t, x)
    else
      table.insert(t, escapeSequences[string.sub(s, i, j)])
    end
  end
  table.insert(t, string.sub(j, j + 1))
  assert(string.find(s, startChar, j + 1), "String decoding failed: missing closing " .. startChar .. " at position " .. j .. "(for string at position " .. startPos .. ")")
  return table.concat(t, ""), j + 2
end

function decode_scanWhitespace(s, startPos)
  local whitespace = " \n\r\t"
  local stringLen = string.len(s)
  while string.find(whitespace, string.sub(s, startPos, startPos), 1, true) and startPos <= stringLen do
    startPos = startPos + 1
  end
  return startPos
end

local escapeList = {
  ["\""] = "\\\"",
  ["\\"] = "\\\\",
  ["/"] = "\\/",
  ["\b"] = "\\b",
  ["\f"] = "\\f",
  ["\n"] = "\\n",
  ["\r"] = "\\r",
  ["\t"] = "\\t"
}

function json_private.encodeString(s)
  local s = tostring(s)
  return s:gsub(".", function(c)
    return escapeList[c]
  end)
end

function isArray(t)
  if t == json.EMPTY_ARRAY then
    return true, 0
  end
  if t == json.EMPTY_OBJECT then
    return false
  end
  local maxIndex = 0
  for k, v in pairs(t) do
    if type(k) == "number" and math.floor(k) == k and k >= 1 then
      if not isEncodable(v) then
        return false
      end
      maxIndex = math.max(maxIndex, k)
    elseif "n" == k then
      if v ~= (t.n or #t) then
        return false
      end
    elseif isEncodable(v) then
      return false
    end
  end
  return true, maxIndex
end

function isEncodable(o)
  local t = type(o)
  return "string" == t or "boolean" == t or "number" == t or "nil" == t or "table" == t or "function" == t and o == json.null
end

return json
