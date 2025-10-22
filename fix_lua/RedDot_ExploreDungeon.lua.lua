RedDotExploreDungeon = {}
local Collectable = function()
  if not ExploreDungeonData then
    return
  end
  local info = ExploreDungeonData.GetPlayerInfo()
  local duration = LoginData.GetCurServerTime() - info.produceStartTime
  local interval = TableData.GetConfig(70011701, "BaseFixed").int_value
  return duration > interval
end
RedDotExploreDungeon.Collectable = Collectable
