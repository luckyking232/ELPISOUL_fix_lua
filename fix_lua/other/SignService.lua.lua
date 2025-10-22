SignService = {}

function SignService.Init()
  Net.AddListener(Proto.MsgName.GetActivityAllRsp, SignService.GetActivityAllRsp)
  Net.AddListener(Proto.MsgName.ActivitySignInRsp, SignService.ActivitySignInRsp)
  Net.AddListener(Proto.MsgName.ActivitySearchRsp, SignService.ActivitySearchRsp)
  Net.AddListener(Proto.MsgName.GetAllBannerRsp, SignService.GetAllBannerRsp)
  Net.AddListener(Proto.MsgName.ActivityReturnSignInRsp, SignService.ActivityReturnSignInRsp)
  Net.AddListener(Proto.MsgName.ActivityDoTurnTableRsp, SignService.ActivityDoTurnTableRsp)
  Net.AddListener(Proto.MsgName.ActivityDoTurnTableRoundRsp, SignService.ActivityDoTurnTableRoundRsp)
  Net.AddListener(Proto.MsgName.ActivityTurnTableGetFreeRsp, SignService.ActivityTurnTableGetFreeRsp)
  Net.AddListener(Proto.MsgName.FetchAccumRechargeRewardRsp, SignService.FetchAccumRechargeRewardRsp)
end

function SignService.GetActivityAllReq(rspCallback)
  local msg = {}
  Net.Send(Proto.MsgName.GetActivityAllReq, msg, rspCallback)
end

function SignService.GetActivityAllRsp(msg)
  SignData.SaveActivityData(msg)
  SignData.signInAct = msg.signInAct
  SignData.searchAct = msg.searchAct
  SignData.turnAct = msg.turnAct
  SignData.roundAct = msg.roundAct
  AdventureData.SaveMultiDropInfo(msg.dropAct)
  if SignData.turnAct and #SignData.turnAct > 1 then
    table.sort(SignData.turnAct, function(a, b)
      return a.baseInfo.activityId < b.baseInfo.activityId
    end)
  end
  UIMgr:SendWindowMessage(WinResConfig.HomeWindow.name, WindowMsgEnum.Common.E_MSG_DAILY_TASK_UPDATE)
  UIMgr:SendWindowMessage(WinResConfig.MultipleWindow.name, WindowMsgEnum.SignWindow.UPDATE_MULTIPLE)
  RedDotMgr.UpdateNode(RED_DOT_DATA_TYPE.SIGN)
end

function SignService.GetAllBannerReq(rspCallback)
  local msg = {}
  Net.Send(Proto.MsgName.GetAllBannerReq, msg, rspCallback)
end

function SignService.GetAllBannerRsp(msg)
  SignData.showAct = msg.idList
end

function SignService.ActivitySignInReq(activityId, rspCallback)
  local msg = {}
  msg.activityId = activityId
  Net.Send(Proto.MsgName.ActivitySignInReq, msg, rspCallback)
end

function SignService.ActivitySignInRsp(msg)
  for i, v in pairs(SignData.signInAct) do
    if v.baseInfo.activityId == msg.signInAct.baseInfo.activityId then
      SignData.signInAct[i] = msg.signInAct
      break
    end
  end
  if SignData.activityData[msg.signInAct.baseInfo.activityId] then
    SignData.activityData[msg.signInAct.baseInfo.activityId] = msg.signInAct
  end
  UIMgr:SendWindowMessage(WinResConfig.SignWindow.name, WindowMsgEnum.SignWindow.GET_REWARD, msg.signInAct)
  RedDotMgr.UpdateNode(RED_DOT_DATA_TYPE.TASK)
end

function SignService.ActivitySearchReq(activityId, pos, rspCallback)
  local msg = {}
  msg.activityId = activityId
  msg.choosePos = pos
  Net.Send(Proto.MsgName.ActivitySearchReq, msg, rspCallback)
end

function SignService.ActivitySearchRsp(msg)
end

function SignService.ActivityReturnSignInReq(signDay, rspCallback)
  local msg = {}
  msg.signDay = signDay
  Net.Send(Proto.MsgName.ActivityReturnSignInReq, msg, rspCallback)
end

function SignService.ActivityReturnSignInRsp(msg)
  SignData.UpdateOneActivityData(msg.returnAct)
  RedDotMgr.UpdateNode(RED_DOT_DATA_TYPE.SIGN)
end

function SignService.ActivityDoTurnTableReq(activityId, rspCallback)
  local msg = {}
  msg.activityId = activityId
  Net.Send(Proto.MsgName.ActivityDoTurnTableReq, msg, rspCallback)
end

function SignService.ActivityDoTurnTableRsp(msg)
end

function SignService.ActivityDoTurnTableRoundReq(activityId, roundId, rspCallback)
  local msg = {}
  msg.activityId = activityId
  msg.roundId = roundId
  Net.Send(Proto.MsgName.ActivityDoTurnTableRoundReq, msg, rspCallback)
end

function SignService.ActivityDoTurnTableRoundRsp(msg)
  GetItemTips.Show(msg.rewards)
  for i = 1, #SignData.roundAct.rounds do
    if SignData.roundAct.rounds[i].round == msg.roundData.round then
      SignData.roundAct.rounds[i] = msg.roundData
    end
  end
end

function SignService.FetchAccumRechargeRewardReq(rechargeLevel, activityId, rspCallback)
  local msg = {}
  msg.rechargeLevel = rechargeLevel
  msg.activityId = activityId
  Net.Send(Proto.MsgName.FetchAccumRechargeRewardReq, msg, rspCallback)
end

function SignService.FetchAccumRechargeRewardRsp(msg)
  SignData.roundAct.dailyRechargeReward = msg.dailyRechargeReward
  SignData.roundAct.fetchedRechargeLevel = msg.fetchedRechargeLevel
  GetItemTips.Show(msg.rewards)
  RedDotMgr.UpdateNode(RED_DOT_DATA_TYPE.SIGN)
end

function SignService.ActivityTurnTableGetFreeReq(activityId, rspCallback)
  local msg = {}
  msg.activityId = activityId
  Net.Send(Proto.MsgName.ActivityTurnTableGetFreeReq, msg, rspCallback)
end

function SignService.ActivityTurnTableGetFreeRsp(msg)
  GetItemTips.Show(msg.rewards)
end

SignService.Init()
