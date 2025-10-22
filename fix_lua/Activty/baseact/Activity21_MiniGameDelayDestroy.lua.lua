local MAX_COUNT_PER_FRAME_DESTROYED = 20
local gobjs, executing

local function OnUpdate()
  local len = gobjs and #gobjs or 0
  if len > 0 then
    local count = 0
    for _ = len, 1, -1 do
      local gobj = table.remove(gobjs)
      if gobj and not gobj.isDisposed then
        gobj:Dispose()
      end
      count = count + 1
      if count >= MAX_COUNT_PER_FRAME_DESTROYED then
        break
      end
    end
  else
    executing = false
    UpdateManager.RemoveUpdateHandler(OnUpdate)
  end
end

local Destroy = function(gobj)
  gobj:RemoveFromParent()
  gobjs = gobjs or {}
  table.insert(gobjs, gobj)
  if not executing then
    executing = true
    UpdateManager.RemoveUpdateHandler(OnUpdate)
    UpdateManager.AddUpdateHandler(OnUpdate)
  end
end
return {Destroy = Destroy}
