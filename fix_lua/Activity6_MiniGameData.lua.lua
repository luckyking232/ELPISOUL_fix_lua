local miniGameInfoDict
local fish = {}
local SetMiniGameInfo = function(info)
  miniGameInfoDict = miniGameInfoDict or {}
  miniGameInfoDict[info.gameId] = info
end
local GetMiniGameInfo = function(gameId)
  if miniGameInfoDict then
    return miniGameInfoDict[gameId]
  end
end
return {SetMiniGameInfo = SetMiniGameInfo, GetMiniGameInfo = GetMiniGameInfo}
