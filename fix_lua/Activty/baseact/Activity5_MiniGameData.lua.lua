local miniGameInfoDict
local fish = {}
local SetMiniGameInfo = function(info)
  miniGameInfoDict = miniGameInfoDict or {}
  miniGameInfoDict[info.gameId] = info
  if info.gameId == 70441006 then
    fish = info.extraCount
  end
end
local GetMiniGameInfo = function(gameId)
  if miniGameInfoDict then
    return miniGameInfoDict[gameId]
  end
end
local GetAllFish = function()
  return fish or {}
end
return {
  SetMiniGameInfo = SetMiniGameInfo,
  GetMiniGameInfo = GetMiniGameInfo,
  GetAllFish = GetAllFish
}
