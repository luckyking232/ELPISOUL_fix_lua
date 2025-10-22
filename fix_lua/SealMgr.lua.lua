local IsEquipped = function(jobType, attrType)
  local equippedInfo = SealData.GetEquippedSealsInfoByJob(jobType)
  local count = equippedInfo and equippedInfo.sealIds and #equippedInfo.sealIds or 0
  local equipped = false
  if count > 0 then
    for _, sealId in ipairs(equippedInfo.sealIds) do
      local sealConf = TableData.GetConfig(sealId, "BaseSeal")
      if sealConf.attr_type == attrType then
        equipped = sealId
        break
      end
    end
  end
  return equipped
end
local EquipSeal = function(jobType, sealId, rspCallback)
  local info = SealData.GetEquippedSealsInfoByJob(jobType)
  local sealIdList
  if info then
    sealIdList = info.sealIds
  else
    sealIdList = {}
  end
  for i = #sealIdList, 1, -1 do
    local conf = TableData.GetConfig(sealId, "BaseSeal")
    local existsConf = TableData.GetConfig(sealIdList[i], "BaseSeal")
    if conf.attr_type == existsConf.attr_type then
      table.remove(sealIdList, i)
    end
  end
  table.insert(sealIdList, sealId)
  SealService.EquipSealReq(jobType, sealIdList, rspCallback)
end
local getD_H = function(timestamp)
  local day = math.floor(timestamp / 86400)
  local mod = timestamp % 86400
  local hour = (mod + LoginData.timezoneOffset) / 3600 % 24
  return day, hour
end
local IsProbabilityHinted = function()
  local key = PLAYER_PREF_ENUM.SEAL_PROBABILITY_HINT
  local timestamp = LoginData.GetCurServerTime()
  local d, h = getD_H(timestamp)
  local lastTimestamp = PlayerPrefsUtil.GetFloat(key, 0)
  local last_d, last_h = getD_H(lastTimestamp)
  if d - last_d > 1 or d > last_d and h >= 5 or d == last_d and last_h < 5 and h > 5 then
    return false
  end
  return true
end
local IsProbabilityIncreaseHinted = function()
  local key = PLAYER_PREF_ENUM.SEAL_PROBABILITY_INCREASE_HINT
  local timestamp = LoginData.GetCurServerTime()
  local d, h = getD_H(timestamp)
  local lastTimestamp = PlayerPrefsUtil.GetFloat(key, 0)
  local last_d, last_h = getD_H(lastTimestamp)
  if d - last_d > 1 or d > last_d and h >= 5 or d == last_d and last_h < 5 and h > 5 then
    return false
  end
  return true
end
local DropHintTimestamp = function()
  local key = PLAYER_PREF_ENUM.SEAL_PROBABILITY_HINT
  local timestamp = LoginData.GetCurServerTime()
  PlayerPrefsUtil.SetFloat(key, timestamp)
end
local DropProbabilityIncreaseHintTimestamp = function()
  local key = PLAYER_PREF_ENUM.SEAL_PROBABILITY_INCREASE_HINT
  local timestamp = LoginData.GetCurServerTime()
  PlayerPrefsUtil.SetFloat(key, timestamp)
end
return {
  IsEquipped = IsEquipped,
  EquipSeal = EquipSeal,
  IsProbabilityHinted = IsProbabilityHinted,
  DropHintTimestamp = DropHintTimestamp,
  IsProbabilityIncreaseHinted = IsProbabilityIncreaseHinted,
  DropProbabilityIncreaseHintTimestamp = DropProbabilityIncreaseHintTimestamp
}
