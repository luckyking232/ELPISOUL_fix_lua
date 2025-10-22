Activity4_MiniGameService = {}
local gameId = 70441004

function Activity4_MiniGameService.MiniGameInfoReq(rspCallback)
  local info = ActivityDungeonData.GetActivityInfo()
  local activityId = info.baseInfo.activityId
  Net.Send(Proto.MsgName.ActivityGetMiniGameReq, {gameId = gameId, activityId = activityId}, rspCallback)
end

function Activity4_MiniGameService.MiniGameInfoRsp(msg)
  Activity4_MiniGameData.SetMiniGameInfo(msg)
  UIMgr:SendWindowMessage(WinResConfig.Activity4MiniGameMainWindow.name, WindowMsgEnum.Activity4_MiniGame.REFRESH_MINIGAME_INFO)
  RedDotMgr.UpdateNode(RED_DOT_DATA_TYPE.ACTIVITY_DUNGENON)
end

local OnSubmitErrCallback = function(errCode)
  if errCode == ProtoEnum.RET_CODE.RC_ROGUE_NODE_REWARD_FETCHED then
    FloatTipsUtil.ShowWarnTips(T(20521))
  end
end

function Activity4_MiniGameService.MiniGameSubmitReq(map, point, seconds, rspCallback)
  local info = ActivityDungeonData.GetActivityInfo()
  local activityId = info.baseInfo.activityId
  local stamp = math.floor(LoginData.GetCurServerTime())
  Net.Send(Proto.MsgName.ActivityPlayMiniGameReq, {
    gameId = gameId,
    activityId = activityId,
    playSec = seconds,
    records = {
      counts = map,
      point = point,
      stamp = stamp
    }
  }, rspCallback, OnSubmitErrCallback)
end

function Activity4_MiniGameService.MiniGameSubmitRsp(msg)
  Activity4_MiniGameService.MiniGameInfoReq(function()
    UIMgr:SendWindowMessage(WinResConfig.Activity4MiniGameWindow.name, WindowMsgEnum.Activity4_MiniGame.RESET)
  end)
end

function Activity4_MiniGameService.MiniGameGetDailyRewardReq()
  local info = ActivityDungeonData.GetActivityInfo()
  local activityId = info.baseInfo.activityId
  Net.Send(Proto.MsgName.ActivityRewardMiniGameReq, {gameId = gameId, activityId = activityId})
end

function Activity4_MiniGameService.MiniGameGetDailyRewardRsp(msg)
  if msg.rewards then
    GetItemTips.Show(msg.rewards)
  end
  Activity4_MiniGameService.MiniGameInfoReq()
end

function Activity4_MiniGameService.Init()
  Net.AddListener(Proto.MsgName.ActivityGetMiniGameRsp, Activity4_MiniGameService.MiniGameInfoRsp)
  Net.AddListener(Proto.MsgName.ActivityPlayMiniGameRsp, Activity4_MiniGameService.MiniGameSubmitRsp)
  Net.AddListener(Proto.MsgName.ActivityRewardMiniGameRsp, Activity4_MiniGameService.MiniGameGetDailyRewardRsp)
end

Activity4_MiniGameService.Init()
