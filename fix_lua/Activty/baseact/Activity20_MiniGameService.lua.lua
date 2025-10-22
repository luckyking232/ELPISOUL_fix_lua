Activity20_MiniGameService = {}
local gameId = Activity20_MiniGameData.gameId

function Activity20_MiniGameService.MiniGameInfoReq(rspCallback)
  local info = ActivityDungeonData.GetActivityInfo()
  local activityId = info.baseInfo.activityId
  Net.Send(Proto.MsgName.ActivityGetMiniGameReq, {gameId = gameId, activityId = activityId}, rspCallback)
end

function Activity20_MiniGameService.MiniGameInfoRsp(msg)
  Activity20_MiniGameData.SetMiniGameInfo(msg)
  UIMgr:SendWindowMessage(WinResConfig.Activity20MiniGameMainWindow.name, WindowMsgEnum.Activity20_MiniGame.REFRESH_MINIGAME_INFO)
  RedDotMgr.UpdateNode(RED_DOT_DATA_TYPE.ACTIVITY_DUNGENON)
end

local OnSubmitErrCallback = function(errCode)
  if errCode == ProtoEnum.RET_CODE.RC_ROGUE_NODE_REWARD_FETCHED then
    FloatTipsUtil.ShowWarnTips(T(20521))
  end
end

function Activity20_MiniGameService.MiniGameSubmitReq(map, point, seconds, extStat, rspCallback)
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

function Activity20_MiniGameService.MiniGameSubmitRsp(msg)
  Activity20_MiniGameService.MiniGameInfoReq(function()
    UIMgr:SendWindowMessage(WinResConfig.Activity20MiniGameWindow.name, WindowMsgEnum.Activity20_MiniGame.RESET)
  end)
end

function Activity20_MiniGameService.MiniGameGetDailyRewardReq()
  local info = ActivityDungeonData.GetActivityInfo()
  local activityId = info.baseInfo.activityId
  Net.Send(Proto.MsgName.ActivityRewardMiniGameReq, {gameId = gameId, activityId = activityId})
end

function Activity20_MiniGameService.MiniGameGetDailyRewardRsp(msg)
  if msg.rewards then
    GetItemTips.Show(msg.rewards)
  end
  Activity20_MiniGameService.MiniGameInfoReq()
end

function Activity20_MiniGameService.ActivityGetGameTopRankReq(rspCallback)
  local info = ActivityDungeonData.GetActivityInfo()
  local activityId = info.baseInfo.activityId
  Net.Send(Proto.MsgName.ActivityGetGameTopRankReq, {gameId = gameId, activityId = activityId}, rspCallback)
end

function Activity20_MiniGameService.ActivityGetGameTopRankRsp(msg)
  Activity20_MiniGameData.rankInfo = msg
end

function Activity20_MiniGameService.Init()
  Net.AddListener(Proto.MsgName.ActivityGetMiniGameRsp, Activity20_MiniGameService.MiniGameInfoRsp)
  Net.AddListener(Proto.MsgName.ActivityPlayMiniGameRsp, Activity20_MiniGameService.MiniGameSubmitRsp)
  Net.AddListener(Proto.MsgName.ActivityRewardMiniGameRsp, Activity20_MiniGameService.MiniGameGetDailyRewardRsp)
  Net.AddListener(Proto.MsgName.ActivityGetGameTopRankRsp, Activity20_MiniGameService.ActivityGetGameTopRankRsp)
end

Activity20_MiniGameService.Init()
