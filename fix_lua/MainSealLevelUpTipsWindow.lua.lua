require("ExploreDevelop_SealLevelUpTipsWindowByName")
local MainSealLevelUpTipsWindow = {}
local uis, contentPane, levelUpOrQualityUp, jobIndex
local GetMainSealTitle = function(job, level, quality)
  local prefix = T(20699 + quality)
  local suffix
  if quality > 0 then
    local conf = SealData.GetMainSealQualityUpConfig(job, quality - 1)
    suffix = level - conf.level_max
  else
    suffix = level
  end
  if suffix <= 0 then
    return prefix
  end
  return prefix
end

function MainSealLevelUpTipsWindow.ReInitData()
end

function MainSealLevelUpTipsWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.MainSealLevelUpTipsWindow.package, WinResConfig.MainSealLevelUpTipsWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetExploreDevelop_SealLevelUpTipsWindowUis(contentPane)
    jobIndex = bridgeObj.argTable[1]
    levelUpOrQualityUp = bridgeObj.argTable[2]
    MainSealLevelUpTipsWindow.UpdateInfo()
    MainSealLevelUpTipsWindow.InitBtn()
  end)
end

function MainSealLevelUpTipsWindow.UpdateInfo()
  local breakthroughSucceedText = levelUpOrQualityUp and T(20713) or T(20714)
  local configs = SealData.GetSealJobConfigs()
  local sealInfo = SealData.GetEquippedSealsInfoByJob(configs[jobIndex].job)
  local mainSealTitleText = GetMainSealTitle(jobIndex, sealInfo.bigSealLevel, sealInfo.bigSealQuality)
  uis.Main.LevelUpTipsContent.Breach.WordTxt.text = mainSealTitleText
  uis.Main.LevelUpTipsContent.TitleTxt.text = breakthroughSucceedText
  local list = uis.Main.LevelUpTipsContent.AttributeList
  local oldLevelConfig = SealData.GetMainSealLevelUpConfig(jobIndex, sealInfo.bigSealLevel - 1)
  local levelConfig = SealData.GetMainSealLevelUpConfig(jobIndex, sealInfo.bigSealLevel)
  local oldQualityConfig = SealData.GetMainSealQualityUpConfig(jobIndex, sealInfo.bigSealQuality - 1)
  local qualityConfig = SealData.GetMainSealQualityUpConfig(jobIndex, sealInfo.bigSealQuality)
  uis.Main.LevelUpTipsContent.Breach.c1Ctr.selectedIndex = qualityConfig.show_type
  local level_add_attr = levelConfig.add_attr
  local quality_add_attr = qualityConfig.add_attr
  local old_quality_add_attr = oldQualityConfig and oldQualityConfig.add_attr
  local indexOffset = levelUpOrQualityUp and 0 or 1
  
  function list.itemProvider(i)
    if levelUpOrQualityUp then
      return "ui://ExploreDevelop/SealLevel_UpAttribute2"
    elseif i > 0 then
      return "ui://ExploreDevelop/SealLevel_UpAttribute2"
    else
      return "ui://ExploreDevelop/SealLevel_UpAttribute1"
    end
  end
  
  function list.itemRenderer(i, gcmp)
    if not levelUpOrQualityUp and 0 == i then
      local levelThresholdUpText = T(20715)
      UIUtil.SetText(gcmp, levelThresholdUpText, "NameTxt")
      UIUtil.SetText(gcmp, oldQualityConfig.level_max, "Number1Txt")
      UIUtil.SetText(gcmp, qualityConfig.level_max, "Number2Txt")
      return
    end
    local add_attr_index = i + 1 - indexOffset
    local level_add_str = level_add_attr[add_attr_index]
    local splits = Split(level_add_str, ":")
    local id = tonumber(splits[2])
    local val = tonumber(splits[3])
    local oldVal
    if not levelUpOrQualityUp then
      oldVal = val
      for _, v in ipairs(old_quality_add_attr) do
        local strs = Split(v, ":")
        if strs[2] == splits[2] then
          oldVal = oldVal + tonumber(strs[3])
        end
      end
      for _, v in ipairs(quality_add_attr) do
        local strs = Split(v, ":")
        if strs[2] == splits[2] then
          val = val + tonumber(strs[3])
        end
      end
    else
      oldVal = tonumber(Split(oldLevelConfig.add_attr[add_attr_index], ":")[3])
      for _, v in ipairs(quality_add_attr) do
        local strs = Split(v, ":")
        if strs[2] == splits[2] then
          val = val + tonumber(strs[3])
          oldVal = oldVal + tonumber(strs[3])
        end
      end
    end
    local attrName = TableData.GetConfig(id, "BaseAttribute").display_name()
    if id == ProtoEnum.ATTR_ID.ATK then
      ChangeUIController(gcmp, "c1", 0)
    elseif id == ProtoEnum.ATTR_ID.DEF then
      ChangeUIController(gcmp, "c1", 1)
    elseif id == ProtoEnum.ATTR_ID.MAX_HP then
      ChangeUIController(gcmp, "c1", 2)
    end
    ChangeUIController(gcmp, "c2", 1)
    UIUtil.SetText(gcmp, attrName, "NameTxt")
    UIUtil.SetText(gcmp, oldVal, "Number1Txt")
    UIUtil.SetText(gcmp, val, "Number2Txt")
  end
  
  list.numItems = #level_add_attr + indexOffset
  UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/Badge/FX_ui_badge_levelup_new.prefab", uis.Main.LevelUpTipsContent.EffectHolder)
end

function MainSealLevelUpTipsWindow.InitBtn()
  uis.Main.TouchScreenBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.MainSealLevelUpTipsWindow.name)
  end)
end

function MainSealLevelUpTipsWindow.OnClose()
  uis = nil
  contentPane = nil
  UIMgr:SendWindowMessage(WinResConfig.SealWindow.name, WindowMsgEnum.SealWindow.PLAY_BREAKTHROUGH_EFFECT)
end

return MainSealLevelUpTipsWindow
