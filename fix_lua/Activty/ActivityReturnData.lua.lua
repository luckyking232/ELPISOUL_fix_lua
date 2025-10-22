local activInfo
local SetActivityInfo = function(data)
  activInfo = data
end
local GetActivityInfo = function()
  return activInfo
end
local UpdateSignInfo = function(signDay, loginReward)
  if not activInfo then
    return
  end
  activInfo.signDay = signDay
  activInfo.freeReward = loginReward
end
local UpdateTaskInfo = function(changedTasks)
  if not activInfo then
    return
  end
  if changedTasks then
    local tasklist = activInfo.taskList or {}
    for _, v in ipairs(changedTasks) do
      local k = table.keyof(tasklist, v.uid, "uid")
      if k then
        tasklist[k] = v
      else
        table.insert(tasklist, v)
      end
    end
    activInfo.taskList = tasklist
  end
end
local UpdateBoughtItems = function(items)
  if not activInfo then
    return
  end
  for k, v in pairs(items) do
    activInfo.boughtItem[k] = v
  end
end
return {
  SetActivityInfo = SetActivityInfo,
  GetActivityInfo = GetActivityInfo,
  UpdateSignInfo = UpdateSignInfo,
  UpdateTaskInfo = UpdateTaskInfo,
  UpdateBoughtItems = UpdateBoughtItems
}
