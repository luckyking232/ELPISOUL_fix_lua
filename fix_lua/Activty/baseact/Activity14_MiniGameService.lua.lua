local cachedGameId
local MiniGameInfoReq = function(gameId, rspCallback)
  local info = ActivityDungeonData.GetActivityInfo()
  local activityId = info.baseInfo.activityId
  Net.Send(Proto.MsgName.ActivityGetMiniGameReq, {activityId = activityId, gameId = gameId}, rspCallback)
end
local MiniGameInfoRsp = function(msg)
  Activity14_MiniGameData.SetMiniGameInfo(msg)
  UIMgr:SendWindowMessage(WinResConfig.Activity14MiniGameMainWindow.name, WindowMsgEnum.Activity14_MiniGame.REFRESH_MINIGAME_INFO)
  UIMgr:SendWindowMessage(WinResConfig.Activity14MiniGameWindow.name, WindowMsgEnum.Activity14_MiniGame.REFRESH_MINIGAME_INFO)
  RedDotMgr.UpdateNode(RED_DOT_DATA_TYPE.ACTIVITY_DUNGENON)
end
local OnSubmitErrCallback = function(errCode)
  if errCode == ProtoEnum.RET_CODE.RC_ROGUE_NODE_REWARD_FETCHED then
    FloatTipsUtil.ShowWarnTips(T(20521))
  end
end
local MiniGameSubmitReq = function(gameId, map, point, seconds, rspCallback)
  local info = ActivityDungeonData.GetActivityInfo()
  local activityId = info.baseInfo.activityId
  cachedGameId = gameId
  Net.Send(Proto.MsgName.ActivityPlayMiniGameReq, {
    activityId = activityId,
    gameId = gameId,
    playSec = seconds,
    records = {
      counts = map,
      point = point,
      stamp = 0
    }
  }, rspCallback, OnSubmitErrCallback)
end
local MiniGameSubmitRsp = function(msg)
  if cachedGameId then
    MiniGameInfoReq(cachedGameId)
  end
end
local MiniGameGetDailyRewardReq = function(gameId)
  local info = ActivityDungeonData.GetActivityInfo()
  local activityId = info.baseInfo.activityId
  Net.Send(Proto.MsgName.ActivityRewardMiniGameReq, {activityId = activityId, gameId = gameId})
end
local MiniGameGetDailyRewardRsp = function(msg)
  if msg.rewards then
    GetItemTips.Show(msg.rewards)
  end
  MiniGameInfoReq(msg.gameId)
end
local Init = function()
  Net.AddListener(Proto.MsgName.ActivityGetMiniGameRsp, MiniGameInfoRsp)
  Net.AddListener(Proto.MsgName.ActivityPlayMiniGameRsp, MiniGameSubmitRsp)
  Net.AddListener(Proto.MsgName.ActivityRewardMiniGameRsp, MiniGameGetDailyRewardRsp)
end
Init()
return {
  MiniGameInfoReq = MiniGameInfoReq,
  MiniGameSubmitReq = MiniGameSubmitReq,
  MiniGameGetDailyRewardReq = MiniGameGetDailyRewardReq
}
