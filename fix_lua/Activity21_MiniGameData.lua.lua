local gameInfo
local SetMiniGameInfo = function(info)
  gameInfo = info
end
local GetMiniGameInfo = function()
  return gameInfo
end
return {SetMiniGameInfo = SetMiniGameInfo, GetMiniGameInfo = GetMiniGameInfo}
