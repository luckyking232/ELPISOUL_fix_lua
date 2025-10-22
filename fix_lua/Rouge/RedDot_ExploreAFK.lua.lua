RedDotExploreAFK = {}
local HasAnyFinishedDispatch = function()
  if not ExploreAFKData then
    return
  end
  local allGroupsInfo = ExploreAFKData.GetAllGroupsInfo()
  if allGroupsInfo then
    local timestamp = LoginData.GetCurServerTime()
    for _, groupInfo in ipairs(allGroupsInfo) do
      if timestamp >= groupInfo.overStamp then
        return true
      end
    end
  end
end
local getD_H = function(timestamp)
  local day = math.floor(timestamp / 86400)
  local mod = timestamp % 86400
  local hour = (mod + LoginData.timezoneOffset) / 3600 % 24
  return day, hour
end
local HasAnyAvailableDispatch = function()
  if not ExploreAFKData then
    return
  end
  local level = ExploreAFKData.GetLevel()
  local tbl = TableData.GetTable("BaseDispatchTeam")
  local str = PlayerPrefsUtil.GetString(PLAYER_PREF_ENUM.EXPLORE_AFK_AVAILABLE_TEAM, "")
  local o = not string.isEmptyOrNil(str) and Json.decode(str)
  for id, v in pairs(tbl) do
    if level >= (v.dispatch_level or 0) then
      local groupInfo = ExploreAFKData.GetGroupInfo(id)
      local outOfDate = true
      local k = o and table.keyof(o, id, "groupId")
      if k then
        local timestamp = o[k].timestamp
        local d, h = getD_H(LoginData.GetCurServerTime())
        local last_d, last_h = getD_H(timestamp)
        outOfDate = d - last_d > 1 or d > last_d and h >= 5 or d == last_d and last_h < 5 and h > 5
      end
      if not groupInfo and outOfDate then
        return true
      end
    end
  end
end
local IsGroupCompleted = function(groupId)
  if ExploreAFKMgr then
    return ExploreAFKMgr.IsGroupCompleted(groupId)
  end
end
local IsGroupAvailable = function(groupId)
  if ExploreAFKMgr then
    local str = PlayerPrefsUtil.GetString(PLAYER_PREF_ENUM.EXPLORE_AFK_AVAILABLE_TEAM, "")
    local o = not string.isEmptyOrNil(str) and Json.decode(str)
    local k = o and table.keyof(o, groupId, "groupId")
    local outOfDate = true
    if k then
      local timestamp = o[k].timestamp
      local d, h = getD_H(LoginData.GetCurServerTime())
      local last_d, last_h = getD_H(timestamp)
      outOfDate = d - last_d > 1 or d > last_d and h >= 5 or d == last_d and last_h < 5 and h > 5
    end
    local result = ExploreAFKMgr.IsGroupAvailable(groupId)
    return result and outOfDate
  end
end
RedDotExploreAFK.HasAnyFinishedDispatch = HasAnyFinishedDispatch
RedDotExploreAFK.HasAnyAvailableDispatch = HasAnyAvailableDispatch
RedDotExploreAFK.IsGroupCompleted = IsGroupCompleted
RedDotExploreAFK.IsGroupAvailable = IsGroupAvailable
