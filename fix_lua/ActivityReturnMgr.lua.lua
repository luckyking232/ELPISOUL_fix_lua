local getD_H = function(timestamp)
  local localTimestamp = timestamp + LoginData.timezoneOffset
  local day = math.floor(localTimestamp / 86400)
  local mod = localTimestamp % 86400
  local hour = mod / 3600 % 24
  return day, hour
end
local GetMultiDroppedEntries = function()
  local activInfo = ActivityReturnData.GetActivityInfo()
  if not activInfo then
    return
  end
  local config = TableData.GetConfig(activInfo.baseInfo.activityId, "BaseActivityReturn")
  local strs = config.stage_double
  local multiDropEntries = {}
  for _, str in ipairs(strs) do
    local splits = Split(str, ":")
    if #splits > 2 then
      local type = tonumber(splits[1])
      local ratio = tonumber(splits[2])
      local threshold = tonumber(splits[3])
      table.insert(multiDropEntries, {
        type = type,
        ratio = ratio,
        threshold = threshold
      })
    end
  end
  return multiDropEntries
end
local Signinable = function(day)
  local activInfo = ActivityReturnData.GetActivityInfo()
  if not activInfo then
    return
  end
  local got = day <= activInfo.signDay
  local locked = day - activInfo.returnDay > 0
  return not got and not locked
end
local Outofdate = function(popupTips)
  local result = true
  local activInfo = ActivityReturnData.GetActivityInfo()
  if activInfo then
    result = LoginData.GetCurServerTime() > activInfo.baseInfo.endStamp
  end
  if result and popupTips then
    FloatTipsUtil.ShowWarnTips(T(20838))
  end
  return result
end
local TriggerPlayerReturnIfNecessary = function()
  if Outofdate() then
    return false
  end
  local key = PLAYER_PREF_ENUM.ACTIVITY_PLAYER_RETURN_POPUP
  local timestamp = LoginData.GetCurServerTime()
  local d, h = getD_H(timestamp)
  local lastTimestamp = PlayerPrefsUtil.GetFloat(key, 0)
  local last_d, last_h = getD_H(lastTimestamp)
  local outOfDate = d - last_d > 1 or d > last_d and h >= 5 or d == last_d and last_h < 5 and h > 5
  if outOfDate then
    PlayerPrefsUtil.SetFloat(key, timestamp)
    OpenWindow(WinResConfig.PlayerReturnsPopupWindow.name)
    return true
  end
  return false
end
return {
  TriggerPlayerReturnIfNecessary = TriggerPlayerReturnIfNecessary,
  GetMultiDroppedEntries = GetMultiDroppedEntries,
  Signinable = Signinable,
  Outofdate = Outofdate
}
