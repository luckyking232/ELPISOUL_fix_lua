local activityId
local SetActivityId = function(id)
  activityId = id
end
local GetActivityId = function()
  return activityId
end
local passedStages
local SetPassedStages = function(stages)
  passedStages = stages
end
local GetPassedStages = function()
  return passedStages
end
local tasks
local SetTasks = function(taskList)
  tasks = taskList
  if tasks then
    table.sort(tasks, function(x, y)
      local x_state, y_state = x.state, y.state
      if x_state == y_state then
        return x.taskId < y.taskId
      end
      if x_state == ProtoEnum.TASK_STATE.FINISHED then
        return true
      end
      if y_state == ProtoEnum.TASK_STATE.FINISHED then
        return false
      end
      return x.state < y.state
    end)
  end
end
local UpdateTask = function(taskInfo)
  if tasks then
    local k = table.keyof(tasks, taskInfo.uin, "uin")
    if k then
      tasks[k] = taskInfo
    end
  end
end
local GetTasks = function()
  return tasks
end
local startTimestamp, endTimestamp
local SetTimestamp = function(startTime, endTime)
  startTimestamp = startTime
  endTimestamp = endTime
end
local GetStartTimestamp = function()
  return startTimestamp
end
local GetEndTimestamp = function()
  return endTimestamp
end
return {
  SetActivityId = SetActivityId,
  GetActivityId = GetActivityId,
  SetPassedStages = SetPassedStages,
  GetPassedStages = GetPassedStages,
  SetTasks = SetTasks,
  GetTasks = GetTasks,
  UpdateTask = UpdateTask,
  SetTimestamp = SetTimestamp,
  GetStartTimestamp = GetStartTimestamp,
  GetEndTimestamp = GetEndTimestamp
}
