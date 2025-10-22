local miniGameInfoDict
local SetMiniGameInfo = function(info)
  miniGameInfoDict = miniGameInfoDict or {}
  miniGameInfoDict[info.gameId] = info
end
local GetMiniGameInfo = function(gameId)
  if miniGameInfoDict then
    return miniGameInfoDict[gameId]
  end
end
local rankInfo
local SetRankInfo = function(info)
  rankInfo = info
end
local GetRankInfo = function()
  return rankInfo
end
return {
  SetMiniGameInfo = SetMiniGameInfo,
  GetMiniGameInfo = GetMiniGameInfo,
  SetRankInfo = SetRankInfo,
  GetRankInfo = GetRankInfo
}
