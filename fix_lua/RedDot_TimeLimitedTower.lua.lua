RedDotTimeLimitedTower = {}

function RedDotTimeLimitedTower.IsNewSeason()
  local timestamp = PlayerPrefsUtil.GetInt(PLAYER_PREF_ENUM.TIME_LIMITED_SEASON_RECORD, -1)
  local curStartTimestamp = TimeLimitedTowerData.GetStartTimestamp()
  if curStartTimestamp and curStartTimestamp ~= timestamp then
    return true
  end
end

function RedDotTimeLimitedTower.IsNearlyDeadline()
  local serverTime = LoginData.GetCurServerTime()
  local deadline = TimeLimitedTowerData.GetEndTimestamp()
  local diff = deadline - serverTime
  local threshold = 86400
  if serverTime < deadline and diff < threshold then
    local deadlineRecord = PlayerPrefsUtil.GetString(PLAYER_PREF_ENUM.TIME_LIMITED_TOWER_DEADLINE, "")
    local date = TimeUtil.FormatDate("%Y_%m_%d", serverTime)
    local concat = string.format("%s_%s", deadline, date)
    if concat ~= deadlineRecord then
      return true, diff
    end
  end
  return false, diff
end

function RedDotTimeLimitedTower.HasAnyFinishedTask()
  local tasks = TimeLimitedTowerData.GetTasks()
  if tasks then
    for i, task in ipairs(tasks) do
      local taskState = task.state
      local finished = taskState == ProtoEnum.TASK_STATE.FINISHED
      if finished then
        return true
      end
    end
  end
end
