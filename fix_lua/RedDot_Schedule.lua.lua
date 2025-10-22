RedDotSchedule = {}

function RedDotSchedule.ShowHome()
  local stamp = PlayerPrefsUtil.GetInt(PLAYER_PREF_ENUM.SCHEDULE_DAY)
  if nil == stamp or 0 == stamp then
    PlayerPrefsUtil.SetInt(PLAYER_PREF_ENUM.SCHEDULE_DAY, LoginData.GetCurServerTime())
    return true
  end
  local teamStamp = ResetFiveStamp(stamp)
  local time = math.floor(LoginData.GetCurServerTime() - teamStamp)
  if time > 0 then
    local hours = math.floor(time / 3600)
    local day = math.floor(hours / 24)
    if day >= 1 then
      PlayerPrefsUtil.SetInt(PLAYER_PREF_ENUM.SCHEDULE_DAY, LoginData.GetCurServerTime())
      return true
    end
  end
end

function RedDotSchedule.ShowHomeNew()
  local josnStr = PlayerPrefsUtil.GetString(PLAYER_PREF_ENUM.SCHEDULE_OPEN)
  if string.isEmptyOrNil(josnStr) then
    return true
  end
  local timeInfo = Json.decode(josnStr)
  local info = ScheduleData.GetInfo()
  if info and timeInfo then
    local GetTimeInfoById = function(id)
      for i, v in pairs(timeInfo) do
        if v.id == id then
          return v
        end
      end
    end
    local curTime = LoginData.GetCurServerTime()
    if info.guildWar and info.guildWar.schedule then
      local tempInfo = GetTimeInfoById(70900101)
      if tempInfo and tempInfo.endStamp ~= info.guildWar.schedule.endStamp and curTime >= info.guildWar.schedule.startStamp and curTime < info.guildWar.schedule.endStamp then
        return true
      end
    end
    if info.stageActInfo and info.stageActInfo.stageAct[1] then
      local stageAct = info.stageActInfo.stageAct
      for i = 1, #stageAct do
        local tempInfo = GetTimeInfoById(stageAct[i].baseInfo.activityId)
        local baseInfo = stageAct[i].baseInfo
        if tempInfo and tempInfo.endStamp ~= baseInfo.endStamp and curTime >= baseInfo.startStamp and curTime < baseInfo.endStamp then
          return true
        end
      end
    end
    if info.limitChallenge then
      local tempInfo = GetTimeInfoById(70900103)
      local baseInfo = info.limitChallenge
      if tempInfo and tempInfo.endStamp ~= baseInfo.endStamp and curTime >= baseInfo.startStamp and curTime < baseInfo.endStamp then
        return true
      end
    end
    if info.manor then
      local feature = info.manor.featureSchedules
      for i = 1, #feature do
        if feature[i].open then
          local tempInfo = GetTimeInfoById(feature[i].eventType)
          if tempInfo and tempInfo.endStamp ~= feature[i].endTime then
            return true
          end
        end
      end
    end
    if info.rogueWeekTask then
      local tempInfo = GetTimeInfoById(70900203)
      if tempInfo and tempInfo.endStamp ~= info.rogueWeekTask.refreshStamp then
        return true
      end
    end
    if info.arena then
      local tempInfo = GetTimeInfoById(70900302)
      local arena = info.arena
      if tempInfo and tempInfo.endStamp ~= arena.seasonEndTime and curTime >= arena.seasonStartTime and curTime < arena.seasonEndTime then
        return true
      end
    end
  end
end

function RedDotSchedule.SaveOpen()
  local info = ScheduleData.GetInfo()
  local josnData = {}
  if info then
    if info.guildWar and info.guildWar.schedule then
      local data = {
        id = 70900101,
        startStamp = info.guildWar.schedule.startStamp,
        endStamp = info.guildWar.schedule.endStamp
      }
      table.insert(josnData, data)
    end
    if info.stageActInfo and info.stageActInfo.stageAct[1] then
      for i = 1, #info.stageActInfo.stageAct do
        local data = {
          id = info.stageActInfo.stageAct[i].baseInfo.activityId,
          startStamp = info.stageActInfo.stageAct[i].baseInfo.startStamp,
          endStamp = info.stageActInfo.stageAct[i].baseInfo.endStamp
        }
        table.insert(josnData, data)
      end
    end
    if info.limitChallenge then
      local data = {
        id = 70900103,
        startStamp = info.limitChallenge.startStamp,
        endStamp = info.limitChallenge.endStamp
      }
      table.insert(josnData, data)
    end
    if info.manor then
      local feature = info.manor.featureSchedules
      for i = 1, #feature do
        local data = {
          id = feature[i].eventType,
          startStamp = feature[i].startTime,
          endStamp = feature[i].endTime,
          open = feature[i].open
        }
        table.insert(josnData, data)
      end
    end
    if info.rogueWeekTask then
      local data = {
        id = 70900203,
        startStamp = 0,
        endStamp = info.rogueWeekTask.refreshStamp
      }
      table.insert(josnData, data)
    end
    if info.arena then
      local data = {
        id = 70900302,
        startStamp = info.arena.seasonStartTime,
        endStamp = info.arena.seasonEndTime
      }
      table.insert(josnData, data)
    end
  end
  local str = Json.encode(josnData)
  print(">>>>>>>保存>>>>>>>", str)
  PlayerPrefsUtil.SetString(PLAYER_PREF_ENUM.SCHEDULE_OPEN, str)
end

function RedDotSchedule.CanItem()
  local items = ActorData.GetItems()
  local time = LoginData.GetCurServerTime()
  for _, v in ipairs(items) do
    if v.count > 0 and v.expireStamp > 0 and v.expireStamp - time < 86400 then
      return true
    end
  end
end
