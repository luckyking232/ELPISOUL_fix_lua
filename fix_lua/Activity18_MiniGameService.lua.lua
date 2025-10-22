Activity18_MiniGameService = {}
local gameId = Activity18_MiniGameData.gameId

function Activity18_MiniGameService.MiniGameInfoReq(rspCallback)
  local info = ActivityDungeonData.GetActivityInfo()
  local activityId = info.baseInfo.activityId
  Net.Send(Proto.MsgName.ActivityGetMiniGameReq, {gameId = gameId, activityId = activityId}, rspCallback)
end

function Activity18_MiniGameService.MiniGameInfoRsp(msg)
  Activity18_MiniGameData.SetMiniGameInfo(msg)
  UIMgr:SendWindowMessage(WinResConfig.Activity18MiniGameMainWindow.name, WindowMsgEnum.Activity18_MiniGame.REFRESH_MINIGAME_INFO)
  RedDotMgr.UpdateNode(RED_DOT_DATA_TYPE.ACTIVITY_DUNGENON)
end

local OnSubmitErrCallback = function(errCode)
  if errCode == ProtoEnum.RET_CODE.RC_ROGUE_NODE_REWARD_FETCHED then
    FloatTipsUtil.ShowWarnTips(T(20521))
  end
end

function Activity18_MiniGameService.MiniGameSubmitReq(map, point, seconds, extStat, rspCallback)
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

function Activity18_MiniGameService.MiniGameSubmitRsp(msg)
  Activity18_MiniGameService.MiniGameInfoReq(function()
    UIMgr:SendWindowMessage(WinResConfig.Activity18MiniGameWindow.name, WindowMsgEnum.Activity18_MiniGame.RESET)
  end)
end

function Activity18_MiniGameService.MiniGameGetDailyRewardReq()
  local info = ActivityDungeonData.GetActivityInfo()
  local activityId = info.baseInfo.activityId
  Net.Send(Proto.MsgName.ActivityRewardMiniGameReq, {gameId = gameId, activityId = activityId})
end

function Activity18_MiniGameService.MiniGameGetDailyRewardRsp(msg)
  if msg.rewards then
    GetItemTips.Show(msg.rewards)
  end
  Activity18_MiniGameService.MiniGameInfoReq()
end

function Activity18_MiniGameService.ActivityGetGameTopRankReq(rspCallback)
  local info = ActivityDungeonData.GetActivityInfo()
  local activityId = info.baseInfo.activityId
  Net.Send(Proto.MsgName.ActivityGetGameTopRankReq, {gameId = gameId, activityId = activityId}, rspCallback)
end

function Activity18_MiniGameService.ActivityGetGameTopRankRsp(msg)
  Activity18_MiniGameData.rankInfo = msg
end

function Activity18_MiniGameService.Init()
  Net.AddListener(Proto.MsgName.ActivityGetMiniGameRsp, Activity18_MiniGameService.MiniGameInfoRsp)
  Net.AddListener(Proto.MsgName.ActivityPlayMiniGameRsp, Activity18_MiniGameService.MiniGameSubmitRsp)
  Net.AddListener(Proto.MsgName.ActivityRewardMiniGameRsp, Activity18_MiniGameService.MiniGameGetDailyRewardRsp)
  Net.AddListener(Proto.MsgName.ActivityGetGameTopRankRsp, Activity18_MiniGameService.ActivityGetGameTopRankRsp)
end

Activity18_MiniGameService.Init()
