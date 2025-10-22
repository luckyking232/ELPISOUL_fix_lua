local GetAllActivitiesReq = function(rspCallback)
  Net.Send(Proto.MsgName.GetActivityAllReq, nil, rspCallback)
end
local GetAllActivitiesRsp = function(msg)
  local data = msg.returnProAct
  if type(data) == "table" and _G.next(data) then
    ActivityReturnData.SetActivityInfo(data)
  else
    ActivityReturnData.SetActivityInfo(nil)
  end
end
local ActivityReturnSignReq = function(activityId, signType, rspCallback)
  Net.Send(Proto.MsgName.ActivityReturnProSigninReq, {activityId = activityId, signType = signType}, rspCallback)
end
local ActivityReturnSignRsp = function(msg)
  local rewards = msg.rewards
  local activityId = msg.activityId
  local freeReward = msg.freeReward
  local signDay = msg.signDay
  ActivityReturnData.UpdateSignInfo(signDay, freeReward)
  GetItemTips.Show(rewards)
end
local ActivityReturnPurchaseReq = function(activityId, gridId, count, rspCallback)
  Net.Send(Proto.MsgName.ActivityReturnProShopBuyReq, {
    activityId = activityId,
    gridId = gridId,
    buyCount = count
  }, rspCallback)
end
local ActivityReturnPurchaseRsp = function(msg)
  local activityId = msg.activityId
  local rewards = msg.rewards
  local boughtItem = msg.boughtItem
  ActivityReturnData.UpdateBoughtItems(boughtItem)
  GetItemTips.Show(rewards)
end
local ActivityReturnTaskRewardReq = function(activityId, uid, rspCallback)
  Net.Send(Proto.MsgName.ActivityReturnProTaskRewardReq, {activityId = activityId, taskUid = uid}, rspCallback)
end
local ActivityReturnTaskRewardRsp = function(msg)
  local activityId = msg.activityId
  local rewards = msg.rewards
  local changedTasks = msg.changeTask
  ActivityReturnData.UpdateTaskInfo(changedTasks)
  GetItemTips.Show(rewards)
end
local Init = function()
  Net.AddListener(Proto.MsgName.GetActivityAllRsp, GetAllActivitiesRsp)
  Net.AddListener(Proto.MsgName.ActivityReturnProSigninRsp, ActivityReturnSignRsp)
  Net.AddListener(Proto.MsgName.ActivityReturnProShopBuyRsp, ActivityReturnPurchaseRsp)
  Net.AddListener(Proto.MsgName.ActivityReturnProTaskRewardRsp, ActivityReturnTaskRewardRsp)
end
Init()
return {
  GetAllActivitiesReq = GetAllActivitiesReq,
  ActivityReturnSignReq = ActivityReturnSignReq,
  ActivityReturnPurchaseReq = ActivityReturnPurchaseReq,
  ActivityReturnTaskRewardReq = ActivityReturnTaskRewardReq
}
