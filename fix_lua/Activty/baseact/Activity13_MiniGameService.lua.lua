local cachedGameId
local MiniGameInfoReq = function(gameId, rspCallback)
  local info = ActivityDungeonData.GetActivityInfo()
  local activityId = info.baseInfo.activityId
  Net.Send(Proto.MsgName.ActivityGetMiniGameReq, {activityId = activityId, gameId = gameId}, rspCallback)
end
local MiniGameInfoRsp = function(msg)
  Activity13_MiniGameData.SetMiniGameInfo(msg)
  UIMgr:SendWindowMessage(WinResConfig.Activity13BounceMiniGameMainWindow.name, WindowMsgEnum.Activity13_MiniGame.REFRESH_MINIGAME_INFO)
  UIMgr:SendWindowMessage(WinResConfig.Activity13BounceMiniGameWindow.name, WindowMsgEnum.Activity13_MiniGame.REFRESH_MINIGAME_INFO)
  UIMgr:SendWindowMessage(WinResConfig.Activity13CarGameMainWindow.name, WindowMsgEnum.Activity13_MiniGame.REFRESH_MINIGAME_INFO)
  UIMgr:SendWindowMessage(WinResConfig.Activity13CarGameWindow.name, WindowMsgEnum.Activity13_MiniGame.RESET)
  RedDotMgr.UpdateNode(RED_DOT_DATA_TYPE.ACTIVITY_DUNGENON)
end
local OnSubmitErrCallback = function(errCode)
  if errCode == ProtoEnum.RET_CODE.RC_ROGUE_NODE_REWARD_FETCHED then
    FloatTipsUtil.ShowWarnTips(T(20521))
  end
end
local encrypt = function(num, secret_key)
  local mixed = num ~ secret_key
  mixed = mixed << 5 | mixed >> 27
  local maskLow = secret_key & 65535
  local maskHigh = secret_key >> 16 << 24
  local mask = maskLow | maskHigh
  mixed = mixed + mask
  mixed = mixed ~ mixed >> 16
  return mixed & 65535
end
local MiniGameSubmitReq = function(gameId, map, point, seconds, rspCallback)
  local e = encrypt(point, gameId)
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
    },
    extStat = e
  }, rspCallback, OnSubmitErrCallback)
end
local MiniGameSubmitRsp = function(msg)
  if cachedGameId then
    MiniGameInfoReq(cachedGameId)
  end
end
local MiniGameGetDailyRewardReq = function(gameId, subId)
  local info = ActivityDungeonData.GetActivityInfo()
  local activityId = info.baseInfo.activityId
  Net.Send(Proto.MsgName.ActivityRewardMiniGameReq, {
    activityId = activityId,
    gameId = gameId,
    subId = subId
  })
end
local MiniGameGetDailyRewardRsp = function(msg)
  if msg.rewards then
    local newReward = {}
    local AddItem = function(drop)
      local isFind = false
      for i, v in ipairs(newReward) do
        if v.item.itemId == drop.item.itemId and v.item.tupleType == ProtoEnum.TUPLE_TYPE.ITEM then
          isFind = true
          newReward[i].item.count = newReward[i].item.count + drop.item.count
          break
        end
      end
      if false == isFind then
        table.insert(newReward, drop)
      end
    end
    for i = 1, #msg.rewards do
      AddItem(msg.rewards[i])
    end
    GetItemTips.Show(newReward)
  end
  MiniGameInfoReq(msg.gameId)
end
local MiniGameGetRankInfoReq = function(gameId, rspCallback)
  local info = ActivityDungeonData.GetActivityInfo()
  local activityId = info.baseInfo.activityId
  Net.Send(Proto.MsgName.ActivityGetGameTopRankReq, {gameId = gameId, activityId = activityId}, rspCallback)
end
local MiniGameGetRankInfoRsp = function(msg)
  Activity13_MiniGameData.SetRankInfo(msg)
end
local Init = function()
  Net.AddListener(Proto.MsgName.ActivityGetMiniGameRsp, MiniGameInfoRsp)
  Net.AddListener(Proto.MsgName.ActivityPlayMiniGameRsp, MiniGameSubmitRsp)
  Net.AddListener(Proto.MsgName.ActivityRewardMiniGameRsp, MiniGameGetDailyRewardRsp)
  Net.AddListener(Proto.MsgName.ActivityGetGameTopRankRsp, MiniGameGetRankInfoRsp)
end
Init()
return {
  MiniGameInfoReq = MiniGameInfoReq,
  MiniGameSubmitReq = MiniGameSubmitReq,
  MiniGameGetDailyRewardReq = MiniGameGetDailyRewardReq,
  MiniGameGetRankInfoReq = MiniGameGetRankInfoReq,
  BounceGameSubmitWithLowestScore = function(rspCallback)
    MiniGameSubmitReq(70441016, {}, 0, 0, rspCallback)
  end
}
