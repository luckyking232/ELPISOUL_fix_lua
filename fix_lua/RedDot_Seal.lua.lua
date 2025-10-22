RedDotSeal = {}
local ATTR_ENUM = {
  ATK = 1,
  DEF = 2,
  HP = 3
}
local attributeBuffer = {}
local jobs = {
  1,
  2,
  4,
  5
}
local HasAnyAvailableSlotByJobType = function(jobType, allSeals)
  local result = false
  for _, v in pairs(ATTR_ENUM) do
    table.insert(attributeBuffer, v)
  end
  local sealsInfo = SealData.GetAllEquippedSealsInfo()
  local seals = allSeals or SealData.GetAllSeals(true)
  if sealsInfo then
    local info = sealsInfo[jobType]
    if info.sealIds then
      for _, sealId in ipairs(info.sealIds) do
        local conf = TableData.GetConfig(sealId, "BaseSeal")
        local attr_type = conf.attr_type
        local k = table.keyof(attributeBuffer, attr_type)
        if k then
          table.remove(attributeBuffer, k)
        end
      end
    end
  end
  if #attributeBuffer > 0 and seals and _G.next(seals) then
    for _, seal in ipairs(seals) do
      local conf = TableData.GetConfig(seal.itemId, "BaseSeal")
      if conf.job == jobType and table.keyof(attributeBuffer, conf.attr_type) then
        result = true
        break
      end
    end
  end
  table.clear(attributeBuffer)
  return result
end
local HasAnyAvailableSlot = function()
  ld("Seal")
  local seals = SealData.GetAllSeals(true)
  local result = false
  for _, jobType in ipairs(jobs) do
    if HasAnyAvailableSlotByJobType(jobType, seals) then
      result = true
      break
    end
  end
  return result
end
local UnlockMainSealFirstTime = function()
  if EnterClampUtil.WhetherToEnter(FEATURE_ENUM.SEAL_EXPAND) then
    local val = PlayerPrefsUtil.GetInt(PLAYER_PREF_ENUM.ENTER_MAIN_SEAL_PANEL, -1)
    return val <= 0
  end
end
local MainSealCanUpgrade = function(jobIndex)
  ld("Seal")
  local info = SealData.GetEquippedSealsInfoByJob(jobs[jobIndex])
  if info then
    local levelConf = SealData.GetMainSealLevelUpConfig(jobIndex, info.bigSealLevel)
    local qualityConf = SealData.GetMainSealQualityUpConfig(jobIndex, info.bigSealQuality)
    if info.bigSealLevel < qualityConf.level_max then
      local enough = true
      if levelConf and levelConf.cost then
        for i, v in ipairs(levelConf.cost) do
          local strs = Split(v, ":")
          local id = tonumber(strs[2])
          local val = tonumber(strs[3])
          if val > ActorData.GetItemCount(id) then
            enough = false
            break
          end
        end
        return enough
      end
    end
  end
end
local MainSealCanBreakthrough = function(jobIndex)
  ld("Seal")
  local info = SealData.GetEquippedSealsInfoByJob(jobs[jobIndex])
  if info then
    local qualityConf = SealData.GetMainSealQualityUpConfig(jobIndex, info.bigSealQuality)
    local nextQualityConf = SealData.GetMainSealQualityUpConfig(jobIndex, info.bigSealQuality + 1)
    if info.bigSealLevel == qualityConf.level_max and nextQualityConf then
      local enough = true
      for i, v in ipairs(qualityConf.cost) do
        local strs = Split(v, ":")
        local id = tonumber(strs[2])
        local val = tonumber(strs[3])
        if val > ActorData.GetItemCount(id) then
          enough = false
          break
        end
      end
      return enough
    end
  end
end
local MainSealCanAmplify = function(jobIndex)
  ld("Seal")
  local info = SealData.GetEquippedSealsInfoByJob(jobs[jobIndex])
  if info then
    local forgeConfig = SealData.GetMainSealForgeUpConfig(jobIndex, info.bigSealAddUpLevel)
    local nextForgeUpConfig = SealData.GetMainSealForgeUpConfig(jobIndex, info.bigSealAddUpLevel + 1)
    if forgeConfig.level_condition <= info.bigSealLevel and nextForgeUpConfig then
      local enough = true
      for i, v in ipairs(forgeConfig.cost) do
        local strs = Split(v, ":")
        local id = tonumber(strs[2])
        local val = tonumber(strs[3])
        if val > ActorData.GetItemCount(id) then
          enough = false
          break
        end
      end
      return enough
    end
  end
end
local HasAnyMainSealCanUpgrade = function()
  for i, v in ipairs(jobs) do
    if MainSealCanUpgrade(i) then
      return true
    end
  end
end
local HasAnyMainSealCanBreakthrough = function()
  for i, v in ipairs(jobs) do
    if MainSealCanBreakthrough(i) then
      return true
    end
  end
end
local HasAnyMainSealAmplify = function()
  for i, v in ipairs(jobs) do
    if MainSealCanAmplify(i) then
      return true
    end
  end
end
RedDotSeal.HasAnyAvailableSlot = HasAnyAvailableSlot
RedDotSeal.HasAnyAvailableSlotByJobType = HasAnyAvailableSlotByJobType
RedDotSeal.UnlockMainSealFirstTime = UnlockMainSealFirstTime
RedDotSeal.MainSealCanUpgrade = MainSealCanUpgrade
RedDotSeal.HasAnyMainSealCanUpgrade = HasAnyMainSealCanUpgrade
RedDotSeal.MainSealCanBreakthrough = MainSealCanBreakthrough
RedDotSeal.HasAnyMainSealCanBreakthrough = HasAnyMainSealCanBreakthrough
RedDotSeal.MainSealCanAmplify = MainSealCanAmplify
RedDotSeal.HasAnyMainSealAmplify = HasAnyMainSealAmplify
