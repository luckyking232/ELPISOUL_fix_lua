RedDotPassport = {}

function RedDotPassport.ShowHome()
  if PassportData and PassportData.infoArr and #PassportData.infoArr > 0 then
    for _, v in pairs(PassportData.GetAllPassport()) do
      if RedDotPassport.CanTask(v.passPortId) or RedDotPassport.CanReward(v.passPortId) then
        return true
      end
    end
  end
end

function RedDotPassport.DailyTaskComplete(passPortId)
  if PassportData and PassportData.infoArr and #PassportData.infoArr > 0 then
    for _, v in pairs(PassportData.infoArr) do
      if v.passPortId == passPortId then
        local data = TableData.GetConfig(v.passPortId, "BaseBattlePassport")
        if data and data.level_max > v.lv and 1 == data.group_id then
          for i, vv in pairs(v.dailyTask) do
            if vv.state == ProtoEnum.TASK_STATE.FINISHED then
              return true
            end
          end
        end
      end
    end
  end
  return false
end

function RedDotPassport.WeeklyTaskComplete(passPortId)
  if PassportData and PassportData.infoArr and #PassportData.infoArr > 0 then
    for _, v in pairs(PassportData.infoArr) do
      if passPortId == v.passPortId then
        local data = TableData.GetConfig(v.passPortId, "BaseBattlePassport")
        if data and data.level_max > v.lv and 1 == data.group_id then
          for i, vv in pairs(v.weeklyTask) do
            if vv.state == ProtoEnum.TASK_STATE.FINISHED then
              return true
            end
          end
        end
      end
    end
  end
  return false
end

function RedDotPassport.TotalTaskComplete(passPortId)
  if PassportData and PassportData.infoArr and #PassportData.infoArr > 0 then
    for _, v in pairs(PassportData.infoArr) do
      if v.passPortId == passPortId then
        local data = TableData.GetConfig(v.passPortId, "BaseBattlePassport")
        if data and data.level_max > v.lv and 1 == data.group_id then
          for i, vv in pairs(v.totalTask) do
            if vv.state == ProtoEnum.TASK_STATE.FINISHED then
              return true
            end
          end
        end
      end
    end
  end
  return false
end

function RedDotPassport.TaskComplete(TaskData)
  for i, vv in pairs(TaskData) do
    if vv.state == ProtoEnum.TASK_STATE.FINISHED then
      return true
    end
  end
  return false
end

function RedDotPassport.CanReward(passPortId)
  local GetReward = function(passId, passRewards)
    for _, vv in pairs(passRewards) do
      if vv.passId == passId then
        return vv
      end
    end
  end
  if PassportData and PassportData.infoArr and #PassportData.infoArr > 0 then
    for _, oneInfo in pairs(PassportData.infoArr) do
      if oneInfo.passPortId == passPortId then
        for i, v in pairs(oneInfo.openList) do
          local info = GetReward(v, oneInfo.rewards)
          if nil == info or table.getLen(info.rewardLvs) <= oneInfo.lv then
            return true
          end
        end
      end
    end
  end
end

function RedDotPassport.CanTask(passId)
  return RedDotPassport.DailyTaskComplete(passId) or RedDotPassport.WeeklyTaskComplete(passId) or RedDotPassport.TotalTaskComplete(passId)
end
