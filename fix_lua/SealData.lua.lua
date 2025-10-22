local sealsInfo, sealJobConfigs, allSeals
local UpdateSealInfo = function(info)
  sealsInfo = sealsInfo or {}
  sealsInfo[info.job] = info
end
local GetAllEquippedSealsInfo = function()
  return sealsInfo
end
local GetEquippedSealsInfoByJob = function(jobId)
  if sealsInfo then
    local k = table.keyof(sealsInfo, jobId, "job")
    if k then
      return sealsInfo[k]
    end
  end
end
local GetSealJobConfigs = function()
  if not sealJobConfigs then
    sealJobConfigs = {}
    local tbl = TableData.GetTable("BaseSealJob")
    for _, v in pairs(tbl) do
      table.insert(sealJobConfigs, v)
    end
    table.sort(sealJobConfigs, function(x, y)
      return x.id < y.id
    end)
  end
  return sealJobConfigs
end
local GetMainSealLevelUpConfig = function(jobIndex, mainSealLevel)
  local configs = SealData.GetSealJobConfigs()
  local config = configs[jobIndex]
  return TableData.GetConfig(config.seal_big_id * 1000 + mainSealLevel, "BaseSealBigLevelUp")
end
local GetMainSealQualityUpConfig = function(jobIndex, mainSealQuality)
  local configs = SealData.GetSealJobConfigs()
  local config = configs[jobIndex]
  return TableData.GetConfig(config.seal_big_id * 1000 + mainSealQuality, "BaseSealBigQualityUp")
end
local GetMainSealForgeUpConfig = function(jobIndex, mainSealForge)
  local configs = SealData.GetSealJobConfigs()
  local config = configs[jobIndex]
  return TableData.GetConfig(config.seal_big_id * 1000 + mainSealForge, "BaseSealBigAddUp")
end
local GetAllSeals = function(refresh)
  local items = ActorData.GetItems()
  if items then
    if refresh and allSeals then
      table.clear(allSeals)
    end
    if not allSeals or not _G.next(allSeals) then
      for _, v in ipairs(items) do
        local config = TableData.GetConfig(v.itemId, "BaseItem")
        if 16 == config.type and v.count > 0 then
          allSeals = allSeals or {}
          table.insert(allSeals, SimpleCopy(v))
        end
      end
    end
  end
  return allSeals
end
local GetSealsByFilter = function(filter, buffer, refresh)
  if type(filter) == "function" then
    buffer = buffer or {}
    local result = GetAllSeals(refresh)
    if result then
      for _, v in ipairs(result) do
        local config = TableData.GetConfig(v.itemId, "BaseSeal")
        if filter(v, config) then
          table.insert(buffer, v)
        end
      end
    end
  end
  return buffer
end
local GetSeals_JobType = function(jobType, buffer, refresh)
  return GetSealsByFilter(function(_, sealConf)
    return sealConf.job == jobType
  end, buffer, refresh)
end
local GetSeals_JobType_AttrType = function(jobType, attrType, buffer, refresh)
  return GetSealsByFilter(function(_, sealConf)
    return sealConf.job == jobType and attrType == sealConf.attr_type
  end, buffer, refresh)
end
local SortBySealAttrType = function(x, y)
  return x.attrType < y.attrType
end
local SortBySealLevel = function(x, y)
  local x_conf = TableData.GetConfig(x.itemId, "BaseSeal")
  local y_conf = TableData.GetConfig(y.itemId, "BaseSeal")
  return x_conf.level > y_conf.level
end
local GetSeals_JobType_SplitByAttribute = function(jobType, buffer, refresh, maxLevelExcept)
  local seals = GetSeals_JobType(jobType, buffer, refresh)
  buffer = buffer or {
    [1] = {
      attrType = 1,
      seals = {}
    },
    [2] = {
      attrType = 2,
      seals = {}
    },
    [3] = {
      attrType = 3,
      seals = {}
    }
  }
  if seals then
    for _, v in ipairs(seals) do
      local sealConf = TableData.GetConfig(v.itemId, "BaseSeal")
      local max = sealConf.level >= 10
      local attrType = sealConf.attr_type
      if not max or not maxLevelExcept then
        local k = table.keyof(buffer, attrType, "attrType")
        local entry
        if not k then
          entry = {
            attrType = attrType,
            seals = {}
          }
          table.insert(buffer, entry)
          table.sort(buffer, SortBySealAttrType)
        else
          entry = buffer[k]
        end
        table.insert(entry.seals, v)
        table.sort(entry.seals, SortBySealLevel)
      end
    end
  end
  return buffer
end
local GetAllSealIds = function(buffer)
  buffer = buffer or {}
  if sealsInfo then
    for _, v in pairs(sealsInfo) do
      for _, sealId in ipairs(v.sealIds) do
        table.insert(buffer, sealId)
      end
    end
  end
  return buffer
end
local GetSealBigAttrs = function(buffer)
  buffer = buffer or {}
  if sealsInfo then
    for _, v in pairs(sealsInfo) do
      local job = v.job
      local bigSealLevel = v.bigSealLevel
      local bigSealQuality = v.bigSealQuality
      local bigSealAddUpLevel = v.bigSealAddUpLevel
      table.insert(buffer, string.format("%s:%s:%s:%s", job, bigSealLevel, bigSealQuality, bigSealAddUpLevel))
    end
  end
  return buffer
end
local GetSealIdsByJobType = function(jobType, buffer)
  buffer = buffer or {}
  if sealsInfo and sealsInfo[jobType] then
    for _, sealId in ipairs(sealsInfo[jobType].sealIds) do
      table.insert(buffer, sealId)
    end
  end
  return buffer
end
return {
  UpdateSealInfo = UpdateSealInfo,
  GetAllEquippedSealsInfo = GetAllEquippedSealsInfo,
  GetEquippedSealsInfoByJob = GetEquippedSealsInfoByJob,
  GetSealJobConfigs = GetSealJobConfigs,
  GetMainSealLevelUpConfig = GetMainSealLevelUpConfig,
  GetMainSealQualityUpConfig = GetMainSealQualityUpConfig,
  GetMainSealForgeUpConfig = GetMainSealForgeUpConfig,
  GetAllSeals = GetAllSeals,
  GetSealsByFilter = GetSealsByFilter,
  GetSeals_JobType = GetSeals_JobType,
  GetSeals_JobType_AttrType = GetSeals_JobType_AttrType,
  GetSeals_JobType_SplitByAttribute = GetSeals_JobType_SplitByAttribute,
  GetAllSealIds = GetAllSealIds,
  GetSealBigAttrs = GetSealBigAttrs,
  GetSealIdsByJobType = GetSealIdsByJobType
}
