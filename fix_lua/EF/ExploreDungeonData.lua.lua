local playerInfo, dungeons
local SetPlayerInfo = function(info)
  playerInfo = info
end
local SetDungeonInfo = function(info)
  dungeons = dungeons or {}
  dungeons[info.sceneType] = info
end
local GetPlayerInfo = function()
  return playerInfo
end
local GetBreakthroughDungeonInfo = function()
  return dungeons[ProtoEnum.SCENE_TYPE.SEAL_QUALITY_UP]
end
return {
  SetPlayerInfo = SetPlayerInfo,
  SetDungeonInfo = SetDungeonInfo,
  GetPlayerInfo = GetPlayerInfo,
  GetBreakthroughDungeonInfo = GetBreakthroughDungeonInfo
}
