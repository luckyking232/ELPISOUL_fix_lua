local gameId = 70441013
local MiniGameInfoReq = function(rspCallback)
  local info = ActivityDungeonData.GetActivityStageByShowId(11)
  local activityId = info.baseInfo.activityId
  Net.Send(Proto.MsgName.ActivityGetMiniGameReq, {activityId = activityId, gameId = gameId}, rspCallback)
end
local MiniGameInfoRsp = function(msg)
  Activity11_MiniGameData.SetMiniGameInfo(msg)
  UIMgr:SendWindowMessage(WinResConfig.Activity11MiniGameMainWindow.name, WindowMsgEnum.Activity11_MiniGame.REFRESH_MINIGAME_INFO)
  UIMgr:SendWindowMessage(WinResConfig.Activity11MiniGameWindow.name, WindowMsgEnum.Activity11_MiniGame.REFRESH_MINIGAME_INFO)
  UIMgr:SendWindowMessage(WinResConfig.Activity11MiniGameChoiceWindow.name, WindowMsgEnum.Activity11_MiniGame.REFRESH_MINIGAME_INFO)
  RedDotMgr.UpdateNode(RED_DOT_DATA_TYPE.ACTIVITY_DUNGENON)
end
local OnSubmitErrCallback = function(errCode)
  if errCode == ProtoEnum.RET_CODE.RC_ROGUE_NODE_REWARD_FETCHED then
  end
end
local MiniGameSubmitReq = function(map, point, seconds, rspCallback)
  local info = ActivityDungeonData.GetActivityStageByShowId(11)
  local activityId = info.baseInfo.activityId
  local score = math.max(0, point)
  Net.Send(Proto.MsgName.ActivityPlayMiniGameReq, {
    activityId = activityId,
    gameId = gameId,
    playSec = seconds,
    records = {
      counts = map,
      point = score,
      stamp = 0
    }
  }, rspCallback, OnSubmitErrCallback)
end
local MiniGameSubmitRsp = function(msg)
  MiniGameInfoReq()
end
local MiniGameGetDailyRewardReq = function()
  local info = ActivityDungeonData.GetActivityStageByShowId(11)
  local activityId = info.baseInfo.activityId
  Net.Send(Proto.MsgName.ActivityRewardMiniGameReq, {activityId = activityId, gameId = gameId})
end
local MiniGameGetDailyRewardRsp = function(msg)
  if msg.rewards then
    GetItemTips.Show(msg.rewards)
  end
  MiniGameInfoReq()
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
