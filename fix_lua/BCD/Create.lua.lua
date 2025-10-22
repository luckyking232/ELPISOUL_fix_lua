local _Class = {}
ClassType = {Class = 1, Instance = 2}

function Create(className, base)
  assert(type(className) == "string" and #className > 0)
  local class = {}
  class.__ctor = false
  class.__delete = false
  class.__cname = className
  class.__ctype = ClassType.Class
  class.base = base
  
  function class.New(...)
    local inst = {}
    inst.__class = class
    inst.__ctype = ClassType.Instance
    setmetatable(inst, {
      __index = _Class[class]
    })
    do
      local create
      
      function create(c, ...)
        if c.base then
          create(c.base, ...)
        end
        if c.__ctor then
          c.__ctor(inst, ...)
        end
      end
      
      create(class, ...)
    end
    
    function inst:Delete()
      local _base = self.__class
      while _base do
        if _base.__delete then
          _base.__delete(self)
        end
        _base = _base.base
      end
    end
    
    return inst
  end
  
  local vtbl = {}
  _Class[class] = vtbl
  setmetatable(class, {
    __newindex = function(t, k, v)
      vtbl[k] = v
    end,
    __index = vtbl
  })
  if base then
    setmetatable(vtbl, {
      __index = function(t, k)
        return _Class[base][k]
      end
    })
  end
  return class
end
