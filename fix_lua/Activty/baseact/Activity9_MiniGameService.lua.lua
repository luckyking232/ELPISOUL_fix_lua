Activity9_MiniGameService = {}
local cachedGameId

function Activity9_MiniGameService.MiniGameInfoReq(gameId, rspCallback)
  local info = ActivityDungeonData.GetActivityInfo()
  local activityId = info.baseInfo.activityId
  cachedGameId = gameId
  Net.Send(Proto.MsgName.ActivityGetMiniGameReq, {gameId = gameId, activityId = activityId}, rspCallback)
end

function Activity9_MiniGameService.MiniGameInfoRsp(msg)
  Activity9_MiniGameData.SetMiniGameInfo(msg)
  UIMgr:SendWindowMessage(WinResConfig.Activity9MiniGameMainWindow.name, WindowMsgEnum.Activity9_MiniGame.REFRESH_MINIGAME_INFO)
  UIMgr:SendWindowMessage(WinResConfig.Activity9SnakeGameMainWindow.name, WindowMsgEnum.Activity9_MiniGame.REFRESH_MINIGAME_INFO)
  RedDotMgr.UpdateNode(RED_DOT_DATA_TYPE.ACTIVITY_DUNGENON)
end

local OnSubmitErrCallback = function(errCode)
  if errCode == ProtoEnum.RET_CODE.RC_ROGUE_NODE_REWARD_FETCHED then
    FloatTipsUtil.ShowWarnTips(T(20521))
  end
end

function Activity9_MiniGameService.MiniGameSubmitReq(gameId, map, point, seconds, rspCallback)
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

function Activity9_MiniGameService.MiniGameSubmitRsp(msg)
  if cachedGameId then
    Activity9_MiniGameService.MiniGameInfoReq(cachedGameId, function()
      UIMgr:SendWindowMessage(WinResConfig.Activity9MiniGameWindow.name, WindowMsgEnum.Activity9_MiniGame.RESET)
      UIMgr:SendWindowMessage(WinResConfig.Activity9SnakeGameWindow.name, WindowMsgEnum.Activity9_MiniGame.RESET)
    end)
  end
end

function Activity9_MiniGameService.MiniGameGetDailyRewardReq(gameId)
  local info = ActivityDungeonData.GetActivityInfo()
  local activityId = info.baseInfo.activityId
  Net.Send(Proto.MsgName.ActivityRewardMiniGameReq, {gameId = gameId, activityId = activityId})
end

function Activity9_MiniGameService.MiniGameGetDailyRewardRsp(msg)
  if msg.rewards then
    GetItemTips.Show(msg.rewards)
  end
  Activity9_MiniGameService.MiniGameInfoReq(msg.gameId)
end

function Activity9_MiniGameService.Init()
  Net.AddListener(Proto.MsgName.ActivityGetMiniGameRsp, Activity9_MiniGameService.MiniGameInfoRsp)
  Net.AddListener(Proto.MsgName.ActivityPlayMiniGameRsp, Activity9_MiniGameService.MiniGameSubmitRsp)
  Net.AddListener(Proto.MsgName.ActivityRewardMiniGameRsp, Activity9_MiniGameService.MiniGameGetDailyRewardRsp)
end

Activity9_MiniGameService.Init()
