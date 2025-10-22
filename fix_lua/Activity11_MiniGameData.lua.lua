local utils = require("Activity11_MiniGameDeserializer")
local miniGameInfoDict, levelConfigs
local SetMiniGameInfo = function(info)
  miniGameInfoDict = miniGameInfoDict or {}
  miniGameInfoDict[info.gameId] = info
end
local GetMiniGameInfo = function(gameId)
  if miniGameInfoDict then
    return miniGameInfoDict[gameId]
  end
end
local GetOrLoadLevelConfigs = function()
  if not levelConfigs then
    local path = "Assets/Data/ActivityData/bubbleshooterlevels.bytes"
    levelConfigs = utils.DeserializeLevelConfigs(path)
  end
  return levelConfigs
end
local Release = function()
  levelConfigs = nil
  miniGameInfoDict = nil
end
return {
  SetMiniGameInfo = SetMiniGameInfo,
  GetMiniGameInfo = GetMiniGameInfo,
  GetOrLoadLevelConfigs = GetOrLoadLevelConfigs,
  Release = Release
}
