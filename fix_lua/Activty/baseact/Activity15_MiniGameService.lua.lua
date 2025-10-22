Activity15_MiniGameService = {}
local gameId = Activity15_MiniGameData.gameId

function Activity15_MiniGameService.MiniGameInfoReq(rspCallback)
  local info = ActivityDungeonData.GetActivityInfo()
  local activityId = info.baseInfo.activityId
  Net.Send(Proto.MsgName.ActivityGetMiniGameReq, {gameId = gameId, activityId = activityId}, rspCallback)
end

function Activity15_MiniGameService.MiniGameInfoRsp(msg)
  Activity15_MiniGameData.SetMiniGameInfo(msg)
  UIMgr:SendWindowMessage(WinResConfig.Activity15MiniGameMainWindow.name, WindowMsgEnum.Activity15_MiniGame.REFRESH_MINIGAME_INFO)
  RedDotMgr.UpdateNode(RED_DOT_DATA_TYPE.ACTIVITY_DUNGENON)
end

local OnSubmitErrCallback = function(errCode)
  if errCode == ProtoEnum.RET_CODE.RC_ROGUE_NODE_REWARD_FETCHED then
    FloatTipsUtil.ShowWarnTips(T(20521))
  end
end

function Activity15_MiniGameService.MiniGameSubmitReq(map, point, seconds, extStat, rspCallback)
  local info = ActivityDungeonData.GetActivityInfo()
  local activityId = info.baseInfo.activityId
  local stamp = math.floor(LoginData.GetCurServerTime())
  Net.Send(Proto.MsgName.ActivityPlayMiniGameReq, {
    gameId = gameId,
    activityId = activityId,
    playSec = seconds,
    extStat = extStat,
    records = {
      counts = map,
      point = point,
      stamp = stamp
    }
  }, rspCallback, OnSubmitErrCallback)
end

function Activity15_MiniGameService.MiniGameSubmitRsp(msg)
  Activity15_MiniGameService.MiniGameInfoReq(function()
    UIMgr:SendWindowMessage(WinResConfig.Activity15MiniGameWindow.name, WindowMsgEnum.Activity15_MiniGame.RESET)
  end)
end

function Activity15_MiniGameService.MiniGameGetDailyRewardReq()
  local info = ActivityDungeonData.GetActivityInfo()
  local activityId = info.baseInfo.activityId
  Net.Send(Proto.MsgName.ActivityRewardMiniGameReq, {gameId = gameId, activityId = activityId})
end

function Activity15_MiniGameService.MiniGameGetDailyRewardRsp(msg)
  if msg.rewards then
    GetItemTips.Show(msg.rewards)
  end
  Activity15_MiniGameService.MiniGameInfoReq()
end

function Activity15_MiniGameService.ActivityGetGameTopRankReq(rspCallback)
  local info = ActivityDungeonData.GetActivityInfo()
  local activityId = info.baseInfo.activityId
  Net.Send(Proto.MsgName.ActivityGetGameTopRankReq, {gameId = gameId, activityId = activityId}, rspCallback)
end

function Activity15_MiniGameService.ActivityGetGameTopRankRsp(msg)
  Activity15_MiniGameData.rankInfo = msg
end

function Activity15_MiniGameService.Init()
  Net.AddListener(Proto.MsgName.ActivityGetMiniGameRsp, Activity15_MiniGameService.MiniGameInfoRsp)
  Net.AddListener(Proto.MsgName.ActivityPlayMiniGameRsp, Activity15_MiniGameService.MiniGameSubmitRsp)
  Net.AddListener(Proto.MsgName.ActivityRewardMiniGameRsp, Activity15_MiniGameService.MiniGameGetDailyRewardRsp)
  Net.AddListener(Proto.MsgName.ActivityGetGameTopRankRsp, Activity15_MiniGameService.ActivityGetGameTopRankRsp)
end

Activity15_MiniGameService.Init()
