Activity10_MiniGameService = {}
local gameId = Activity10_MiniGameData.gameId

function Activity10_MiniGameService.MiniGameInfoReq(rspCallback)
  local info = ActivityDungeonData.GetActivityInfo()
  local activityId = info.baseInfo.activityId
  Net.Send(Proto.MsgName.ActivityGetMiniGameReq, {gameId = gameId, activityId = activityId}, rspCallback)
end

function Activity10_MiniGameService.MiniGameInfoRsp(msg)
  Activity10_MiniGameData.SetMiniGameInfo(msg)
  UIMgr:SendWindowMessage(WinResConfig.Activity10MiniGameMainWindow.name, WindowMsgEnum.Activity10_MiniGame.REFRESH_MINIGAME_INFO)
  RedDotMgr.UpdateNode(RED_DOT_DATA_TYPE.ACTIVITY_DUNGENON)
end

local OnSubmitErrCallback = function(errCode)
  if errCode == ProtoEnum.RET_CODE.RC_ROGUE_NODE_REWARD_FETCHED then
    FloatTipsUtil.ShowWarnTips(T(20521))
  end
end

function Activity10_MiniGameService.MiniGameSubmitReq(map, point, seconds, extStat, rspCallback)
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

function Activity10_MiniGameService.MiniGameSubmitRsp(msg)
  Activity10_MiniGameService.MiniGameInfoReq(function()
    UIMgr:SendWindowMessage(WinResConfig.Activity10MiniGameWindow.name, WindowMsgEnum.Activity10_MiniGame.RESET)
  end)
end

function Activity10_MiniGameService.MiniGameGetDailyRewardReq()
  local info = ActivityDungeonData.GetActivityInfo()
  local activityId = info.baseInfo.activityId
  Net.Send(Proto.MsgName.ActivityRewardMiniGameReq, {gameId = gameId, activityId = activityId})
end

function Activity10_MiniGameService.MiniGameGetDailyRewardRsp(msg)
  if msg.rewards then
    GetItemTips.Show(msg.rewards)
  end
  Activity10_MiniGameService.MiniGameInfoReq()
end

function Activity10_MiniGameService.ActivityGetGameTopRankReq(rspCallback)
  local info = ActivityDungeonData.GetActivityInfo()
  local activityId = info.baseInfo.activityId
  Net.Send(Proto.MsgName.ActivityGetGameTopRankReq, {gameId = gameId, activityId = activityId}, rspCallback)
end

function Activity10_MiniGameService.ActivityGetGameTopRankRsp(msg)
  Activity10_MiniGameData.rankInfo = msg
end

function Activity10_MiniGameService.Init()
  Net.AddListener(Proto.MsgName.ActivityGetMiniGameRsp, Activity10_MiniGameService.MiniGameInfoRsp)
  Net.AddListener(Proto.MsgName.ActivityPlayMiniGameRsp, Activity10_MiniGameService.MiniGameSubmitRsp)
  Net.AddListener(Proto.MsgName.ActivityRewardMiniGameRsp, Activity10_MiniGameService.MiniGameGetDailyRewardRsp)
  Net.AddListener(Proto.MsgName.ActivityGetGameTopRankRsp, Activity10_MiniGameService.ActivityGetGameTopRankRsp)
end

Activity10_MiniGameService.Init()
