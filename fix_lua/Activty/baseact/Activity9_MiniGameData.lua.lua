Activity9_MiniGameData = {gameId = 70441010, snakeGameId = 70441011}
local miniGameInfoDict

function Activity9_MiniGameData.SetMiniGameInfo(info)
  miniGameInfoDict = miniGameInfoDict or {}
  miniGameInfoDict[info.gameId] = info
end

function Activity9_MiniGameData.GetMiniGameInfo(gameId)
  if miniGameInfoDict then
    return miniGameInfoDict[gameId]
  end
end

function Activity9_MiniGameData.GetOneMiniGameInfo(gameId)
  if miniGameInfoDict then
    return miniGameInfoDict[gameId or Activity9_MiniGameData.gameId]
  end
end
