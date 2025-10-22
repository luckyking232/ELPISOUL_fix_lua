RedDotPlayerReturn = {}
local HasMultiDroppedCount = function()
  local activInfo = ActivityReturnData.GetActivityInfo()
  if not activInfo then
    return
  end
  local entries = ActivityReturnMgr.GetMultiDroppedEntries()
  local multiDrops = activInfo.dailyDrop
  if multiDrops then
    for i, v in ipairs(entries) do
      local k = table.keyof(multiDrops, v.type, "type")
      if k and multiDrops[k].count > 0 then
        return true
      end
    end
  end
  return false
end
local HasAnyLoginReward = function()
  local activInfo = ActivityReturnData.GetActivityInfo()
  if not activInfo then
    return
  end
  return 0 == activInfo.freeReward
end
local HasAnySignReward = function()
  local activInfo = ActivityReturnData.GetActivityInfo()
  if not activInfo then
    return
  end
  return ActivityReturnMgr.Signinable(math.max(1, activInfo.returnDay))
end
local HasAnyTaskReward = function()
  local activInfo = ActivityReturnData.GetActivityInfo()
  if not activInfo then
    return
  end
  local info = activInfo.taskList[1]
  local rewarded = info.state >= ProtoEnum.TASK_STATE.REWARD
  local finished = info.state >= ProtoEnum.TASK_STATE.FINISHED
  return finished and not rewarded
end
local HasAnyRewards = function()
  if ActivityReturnMgr.Outofdate() then
    return false
  end
  return HasAnyLoginReward() or HasAnySignReward() or HasAnyTaskReward()
end

function RedDotPlayerReturn.HasMultiDroppedCount()
  if ActivityReturnMgr.Outofdate() then
    return false
  end
  return HasMultiDroppedCount()
end

function RedDotPlayerReturn.HasAnyLoginReward()
  if ActivityReturnMgr.Outofdate() then
    return false
  end
  return HasAnyLoginReward()
end

function RedDotPlayerReturn.HasAnySignReward()
  if ActivityReturnMgr.Outofdate() then
    return false
  end
  return HasAnySignReward()
end

function RedDotPlayerReturn.HasAnyTaskReward()
  if ActivityReturnMgr.Outofdate() then
    return false
  end
  return HasAnyTaskReward()
end

RedDotPlayerReturn.HasAnyRewards = HasAnyRewards
