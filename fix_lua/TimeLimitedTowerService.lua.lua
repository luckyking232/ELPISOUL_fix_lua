local GetTimeLimitedTowerInfoReq = function(rspCallback)
  Net.Send(Proto.MsgName.GetLimitChallengeInfoReq, nil, rspCallback)
end
local GetTimeLimitedTowerInfoRsp = function(msg)
  TimeLimitedTowerData.SetActivityId(msg.activityId)
  TimeLimitedTowerData.SetPassedStages(msg.passStages)
  TimeLimitedTowerData.SetTasks(msg.tasks)
  TimeLimitedTowerData.SetTimestamp(msg.startStamp, msg.endStamp)
end
local ResetTimeLimitedTowerReq = function(rspCallback, errorCallback)
  Net.Send(Proto.MsgName.ResetLimitChallengeReq, nil, rspCallback, errorCallback)
end
local ResetTimeLimitedTowerRsp = function(msg)
  TimeLimitedTowerData.SetActivityId(msg.activityId)
  TimeLimitedTowerData.SetPassedStages(msg.passStages)
end
local GetRewardReq = function(taskUin, rspCallback)
  Net.Send(Proto.MsgName.RewardLimitChallengeTaskReq, {taskUin = taskUin}, rspCallback)
end
local GetRewardRsp = function(msg)
  GetItemTips.Show(msg.rewards, true)
  if msg.task then
    TimeLimitedTowerData.UpdateTask(msg.task)
  end
end
local Init = function()
  Net.AddListener(Proto.MsgName.GetLimitChallengeInfoRsp, GetTimeLimitedTowerInfoRsp)
  Net.AddListener(Proto.MsgName.ResetLimitChallengeRsp, ResetTimeLimitedTowerRsp)
  Net.AddListener(Proto.MsgName.RewardLimitChallengeTaskRsp, GetRewardRsp)
end
Init()
return {
  GetTimeLimitedTowerInfoReq = GetTimeLimitedTowerInfoReq,
  ResetTimeLimitedTowerReq = ResetTimeLimitedTowerReq,
  GetRewardReq = GetRewardReq
}
