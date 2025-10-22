local getDungeonInfoMsg = {
  sceneTypes = {
    ProtoEnum.SCENE_TYPE.SEAL_QUALITY_UP
  }
}
local GetPlayerInfoReq = function(rspCallback)
  Net.Send(Proto.MsgName.GetSealBigHookInfoReq, nil, rspCallback)
end
local GetPlayerInfoRsp = function(msg)
  ExploreDungeonData.SetPlayerInfo(msg.info)
end
local GetRewardReq = function(rspCallback)
  Net.Send(Proto.MsgName.FetchSealBigHookRewardReq, {fastCollect = false}, rspCallback)
end
local FastGetRewardReq = function(consumeType, rspCallback)
  Net.Send(Proto.MsgName.FetchSealBigHookRewardReq, {fastCollect = true, consumeType = consumeType}, rspCallback)
end
local GetRewardRsp = function(msg)
  ExploreDungeonData.SetPlayerInfo(msg.info)
  if msg.rewards and _G.next(msg.rewards) then
    GetItemTips.Show(msg.rewards)
  else
    FloatTipsUtil.ShowWarnTips(T(20739))
  end
  UIMgr:SendWindowMessage(WinResConfig.ExploreDungeonUpgradeWindow.name, WindowMsgEnum.ExploreDungeon.REFRESH_PANEL_INFO)
end
local GetExploreDungeonInfoReq = function(rspCallback)
  Net.Send(Proto.MsgName.GetSceneInfoReq, getDungeonInfoMsg, rspCallback)
end
local GetExploreDungeonInfoRsp = function(msg)
  if msg.sceneInfos then
    for _, v in pairs(msg.sceneInfos) do
      if table.keyof(getDungeonInfoMsg.sceneTypes, v.sceneType) then
        ExploreDungeonData.SetDungeonInfo(v)
      end
    end
  end
end
local QuitSealBigHookChallengeReq = function(rspCallback)
  Net.Send(Proto.MsgName.QuitSealBigHookChallengeReq, nil, rspCallback)
end
local QuitSealBigHookChallengeRsp = function(msg)
  ExploreDungeonData.SetPlayerInfo(msg.info)
end
local Init = function()
  Net.AddListener(Proto.MsgName.GetSceneInfoRsp, GetExploreDungeonInfoRsp)
  Net.AddListener(Proto.MsgName.GetSealBigHookInfoRsp, GetPlayerInfoRsp)
  Net.AddListener(Proto.MsgName.FetchSealBigHookRewardRsp, GetRewardRsp)
  Net.AddListener(Proto.MsgName.QuitSealBigHookChallengeRsp, QuitSealBigHookChallengeRsp)
end
Init()
return {
  GetPlayerInfoReq = GetPlayerInfoReq,
  GetRewardReq = GetRewardReq,
  FastGetRewardReq = FastGetRewardReq,
  GetExploreDungeonInfoReq = GetExploreDungeonInfoReq,
  QuitSealBigHookChallengeReq = QuitSealBigHookChallengeReq
}
