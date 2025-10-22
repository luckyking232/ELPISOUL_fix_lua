require("ExploreDevelop_DevelopWindowByName")
local SealWindow = {}
local uis, contentPane, selectedTabIndex, selectedAttrType, selectedMainSealTabIndex, tweenerCollection
local ATTR_TYPE_LOOKUP = {
  [1] = {
    id = ProtoEnum.ATTR_ID.ATK,
    name = T(80000103),
    index = 1
  },
  [2] = {
    id = ProtoEnum.ATTR_ID.DEF,
    name = T(80000104),
    index = 2
  },
  [3] = {
    id = ProtoEnum.ATTR_ID.MAX_HP,
    name = T(80000102),
    index = 0
  }
}
local ATTR_ID_TYPE_LOOKUP = {
  [ProtoEnum.ATTR_ID.ATK] = 1,
  [ProtoEnum.ATTR_ID.DEF] = 2,
  [ProtoEnum.ATTR_ID.MAX_HP] = 3
}
local BG_EFFECT_LOOKUP = {
  [1] = "Assets/Art/Effects/Prefab/UI_prefab/TeamFormation/sfx_teamformation_dunwei.prefab",
  [2] = "Assets/Art/Effects/Prefab/UI_prefab/TeamFormation/sfx_teamformation_yiren.prefab",
  [4] = "Assets/Art/Effects/Prefab/UI_prefab/TeamFormation/sfx_teamformation_yanling.prefab",
  [5] = "Assets/Art/Effects/Prefab/UI_prefab/TeamFormation/sfx_teamformation_gong.prefab"
}
local LevelText = function(lv_size1, lv_size2, lv_val)
  return string.format("Lv.%s", lv_val)
end
local tweeners
local RefreshEquippedSeals = function(jobIndex, slotIndex, sound)
  local configs = SealData.GetSealJobConfigs()
  local config = configs[jobIndex]
  local jobType = config.job
  local panel = uis.Main.EquipmentRegion
  local name = string.format("Slot%sBtn", slotIndex)
  local cmp = panel[name]
  local attr_type = config.holes[slotIndex]
  local equipped = SealMgr.IsEquipped(jobType, attr_type)
  local loader = cmp:GetChild("PicLoader")
  if equipped then
    local conf = TableData.GetConfig(equipped, "BaseSeal")
    local itemConf = TableData.GetConfig(equipped, "BaseItem")
    local switchTrans = cmp:GetTransition("switch")
    tweeners = tweeners or {}
    local tweenId
    if not loader.url then
      if sound then
        SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/ui_ky_item_use_empt")
      end
      PlayUITrans(cmp, "up")
      UIUtil.SetIconById(loader, equipped)
      UIUtil.SetText(cmp, LevelText(16, 26, conf.level), "LevelTxt")
      tweenId = LeanTween.delayedCall(0.3, function()
        local k = table.keyof(tweeners, tweenId)
        if k then
          table.remove(tweeners, k)
        end
      end).id
    else
      if sound then
        SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/ui_ky_item_use")
      end
      PlayUITrans(cmp, "switch")
      tweenId = LeanTween.delayedCall(0.3, function()
        ChangeUIController(cmp, "color", itemConf.quality)
        UIUtil.SetText(cmp, LevelText(16, 26, conf.level), "LevelTxt")
        UIUtil.SetIconById(loader, equipped)
        local k = table.keyof(tweeners, tweenId)
        if k then
          table.remove(tweeners, k)
        end
      end).id
    end
    table.insert(tweeners, tweenId)
  else
    loader.url = nil
    UIUtil.SetText(cmp, "", "LevelTxt")
  end
  ChangeUIController(cmp, "c2", equipped and 1 or 0)
  ChangeUIController(cmp, "c1", attr_type - 1)
end
local RefreshAllEquippedSeals = function(jobIndex)
  for i = 1, 3 do
    RefreshEquippedSeals(jobIndex, i)
  end
end
local RefreshAttributeAdditions = function(jobIndex)
  local configs = SealData.GetSealJobConfigs()
  local config = configs[jobIndex]
  local jobType = config.job
  local list = uis.Main.AttributeList
  local equippedSealInfo = SealData.GetEquippedSealsInfoByJob(jobType)
  local seals = equippedSealInfo and equippedSealInfo.sealIds
  local attributes = {}
  if seals and _G.next(seals) then
    for _, sealId in ipairs(seals) do
      local conf = TableData.GetConfig(sealId, "BaseSeal")
      for _, str in ipairs(conf.value) do
        local splits = Split(str, ":")
        local id, val = tonumber(splits[2]), tonumber(splits[3])
        local k = table.keyof(attributes, id, "id")
        if k then
          attributes[k].val = attributes[k].val + val
        else
          table.insert(attributes, {
            id = id,
            val = val,
            attr_type = conf.attr_type
          })
        end
      end
    end
  end
  local mainSealLevel = math.max(1, equippedSealInfo.bigSealLevel)
  local mainSealQuality = math.max(0, equippedSealInfo.bigSealQuality)
  local mainSealForge = math.max(1, equippedSealInfo.bigSealAddUpLevel)
  local forgeConfig = SealData.GetMainSealForgeUpConfig(jobIndex, mainSealForge)
  local levelConfig = SealData.GetMainSealLevelUpConfig(jobIndex, mainSealLevel)
  local qualityConfig = SealData.GetMainSealQualityUpConfig(jobIndex, mainSealQuality)
  local level_add_attr = levelConfig.add_attr
  local quality_add_attr = qualityConfig.add_attr
  local forge_add_attr = forgeConfig.add_attr
  for _, str in ipairs(level_add_attr) do
    local strs = Split(str, ":")
    local id = tonumber(strs[2])
    local addition = tonumber(strs[3])
    if addition > 0 then
      local k = table.keyof(attributes, id, "id")
      local attr
      if not k then
        attr = {
          id = id,
          val = 0,
          attr_type = ATTR_ID_TYPE_LOOKUP[id]
        }
        table.insert(attributes, attr)
      else
        attr = attributes[k]
      end
      attr.addition = (attr.addition or 0) + addition
    end
  end
  for _, str in ipairs(quality_add_attr) do
    local strs = Split(str, ":")
    local id = tonumber(strs[2])
    local addition = tonumber(strs[3])
    if addition > 0 then
      local k = table.keyof(attributes, id, "id")
      local attr
      if not k then
        attr = {
          id = id,
          val = 0,
          attr_type = ATTR_ID_TYPE_LOOKUP[id]
        }
        table.insert(attributes, attr)
      else
        attr = attributes[k]
      end
      attr.addition = (attr.addition or 0) + addition
    end
  end
  for _, attr in ipairs(attributes) do
    attr.amplify = math.floor(attr.val * forgeConfig.add_attr / 10000)
  end
  table.sort(attributes, function(x, y)
    return x.attr_type < y.attr_type
  end)
  
  function list.itemRenderer(i, gcmp)
    local entry = attributes[i + 1]
    ChangeUIController(gcmp, "c1", entry.attr_type - 1)
    local conf = TableData.GetConfig(entry.id, "BaseAttribute")
    UIUtil.SetText(gcmp, conf.display_name(), "NameTxt")
    local additionVal = EnterClampUtil.WhetherToEnter(FEATURE_ENUM.SEAL_EXPAND, false) and (entry.addition or 0) or 0
    local amplifyVal = EnterClampUtil.WhetherToEnter(FEATURE_ENUM.SEAL_EXPAND_AMPLIFY, false) and (entry.amplify or 0) or 0
    UIUtil.SetText(gcmp, entry.val + additionVal + amplifyVal, "NumberTxt")
  end
  
  list.numItems = attributes and #attributes or 0
end
local Fold = function(list, time)
  if 0 == list.height then
    return
  end
  tweenerCollection = tweenerCollection or {}
  local id
  id = LeanTween.value(list.height, 0, time):setOnUpdate(function(val)
    list.height = val
  end):setOnComplete(function()
    local key = table.keyof(tweenerCollection, id)
    if key then
      table.remove(tweenerCollection, key)
    end
  end).id
  table.insert(tweenerCollection, id)
end
local Unfold = function(list, elementHeight, gap, time)
  local numChildren = list.numChildren
  local unfoldHeight = numChildren * elementHeight + (numChildren - 1) * gap
  if list.height == unfoldHeight then
    return
  end
  tweenerCollection = tweenerCollection or {}
  local id
  id = LeanTween.value(list.height, unfoldHeight, time):setOnUpdate(function(val)
    list.height = val
  end):setOnComplete(function()
    local key = table.keyof(tweenerCollection, id)
    if key then
      table.remove(tweenerCollection, key)
    end
  end).id
  table.insert(tweenerCollection, id)
end
local PlayItemsTransition = function(list, transition, interval)
  for k = 0, list.numChildren - 1 do
    local child = list:GetChildAt(k)
    local item = child:GetChildAt(0)
    item.alpha = 0
    PlayUITrans(child, "up", nil, (k + 1) * interval)
  end
end

local function RefreshUnequippedSeals(jobIndex, attrType, playanim)
  local configs = SealData.GetSealJobConfigs()
  local config = configs[jobIndex]
  local jobType = config.job
  local list = uis.Main.WearRegion.WearList
  local typeSealsCollection = SealData.GetSeals_JobType_SplitByAttribute(jobType, nil, true)
  local k = table.keyof(typeSealsCollection, attrType, "attrType")
  local typeSeals = typeSealsCollection[k]
  
  function list.itemRenderer(j, gcmp)
    local foldIndex = j + 1
    local titleBtn = gcmp:GetChild("TitleBtn")
    local seals = typeSeals.seals
    local attr_type = typeSeals.attrType
    local attrName = ATTR_TYPE_LOOKUP[attr_type].name
    UIUtil.SetText(titleBtn, attrName, "NameTxt")
    ChangeUIController(titleBtn:GetChild("Attribute"), "c1", attr_type - 1)
    local numSeals = #seals
    local totalSeals = 0
    if numSeals > 0 then
      for i, v in ipairs(seals) do
        totalSeals = totalSeals + v.count
      end
      ChangeUIController(titleBtn, "c1", 0)
    else
      ChangeUIController(titleBtn, "c1", 1)
    end
    titleBtn:GetChild("n6").visible = numSeals > 0
    titleBtn:GetChild("n7").visible = numSeals > 0
    UIUtil.SetText(titleBtn, totalSeals > 999 and "999+" or totalSeals, "NumberTxt")
    local itemlist = gcmp:GetChild("ItemList")
    local elementHeight, gap = 86, 1
    titleBtn.onClick:Set(function()
      if numSeals <= 0 then
        return
      end
      if tweenerCollection and #tweenerCollection > 0 then
        return
      end
      for k = 1, list.numChildren do
        local child = list:GetChildAt(k - 1)
        local item_list = child:GetChild("ItemList")
        local numChildren = item_list.numChildren
        local duration = math.min(0.3, numChildren * 0.03)
        local current = k == foldIndex
        local isUnfold = item_list.height > 0
        if current then
          if isUnfold then
            Fold(item_list, duration)
            ChangeUIController(child:GetChild("TitleBtn"), "button", 0)
          else
            Unfold(item_list, elementHeight, gap, duration)
            PlayItemsTransition(item_list, "up", 0.03)
            ChangeUIController(child:GetChild("TitleBtn"), "button", 1)
            selectedAttrType = attr_type
            for i = 1, 3 do
              local name = string.format("Slot%sBtn", i)
              local panel = uis.Main.EquipmentRegion
              local cmp = panel[name]
              local selectedSlotIndex = table.keyof(config.holes, attr_type)
              ChangeUIController(cmp, "button", selectedSlotIndex and selectedSlotIndex == i and 1 or 0)
            end
          end
        else
          Fold(item_list, duration)
          ChangeUIController(child:GetChild("TitleBtn"), "button", 0)
        end
      end
    end)
    
    function itemlist.itemRenderer(k, subgcmp)
      local subItem = subgcmp:GetChild("DevelopWearItemBtn")
      local itemInfo = seals[k + 1]
      local itemId = itemInfo.itemId
      local sealConf = TableData.GetConfig(itemId, "BaseSeal")
      local attr_type = sealConf.attr_type
      local itemConf = TableData.GetConfig(itemId, "BaseItem")
      local level = sealConf.level
      local splits = Split(sealConf.value[1], ":")
      local attrName = TableData.GetConfig(tonumber(splits[2]), "BaseAttribute").display_name()
      local addVal = splits[3]
      UIUtil.SetText(subItem, string.format("%s +%s", attrName, addVal), "AttributeTxt")
      UIUtil.SetText(subItem, itemInfo.count > 999 and "999+" or itemInfo.count, "NumberTxt")
      UIUtil.SetText(subItem, LevelText(16, 22, level), "LevelTxt")
      ChangeUIController(subItem, "color", itemConf.quality)
      local loader = subItem:GetChild("PicLoader")
      UIUtil.SetIconById(loader, itemId)
      subgcmp.onClick:Set(function()
        SealMgr.EquipSeal(jobType, itemId, function()
          local selectedSlotIndex = table.keyof(config.holes, attr_type)
          RefreshEquippedSeals(jobIndex, selectedSlotIndex, true)
          RefreshUnequippedSeals(jobIndex, attr_type)
          RefreshAttributeAdditions(jobIndex)
          RedDotMgr.UpdateNodeByWindowName(WinResConfig.SealWindow.name)
        end)
      end)
      local holder = subItem:GetChild("EffectHolder")
      holder.touchable = false
      loader.onClick:Set(function(context)
        context:StopPropagation()
        OpenWindow(WinResConfig.SealGetTipsWindow.name, nil, {id = itemId, notShowWay = false})
      end)
    end
    
    itemlist.numItems = numSeals
    local unfoldHeight = numSeals * elementHeight + (numSeals - 1) * gap
    if attrType then
      local current = attrType == attr_type
      if playanim then
        if current then
          for k = 1, list.numChildren do
            local child = list:GetChildAt(k - 1)
            local item_list = child:GetChild("ItemList")
            if k == foldIndex then
              Unfold(item_list, elementHeight, gap, 0.3)
              ChangeUIController(child:GetChild("TitleBtn"), "button", 1)
            else
              Fold(item_list, 0.3)
              ChangeUIController(child:GetChild("TitleBtn"), "button", 0)
            end
          end
        end
      else
        itemlist.height = current and unfoldHeight or 0
        ChangeUIController(titleBtn, "button", itemlist.height > 0 and 1 or 0)
      end
    end
    if playanim then
      PlayItemsTransition(itemlist, "up", 0.03)
    end
  end
  
  list.numItems = 1
  list.scrollItemToViewOnClick = false
end

local red = Color(1.0, 0.4, 0.47058823529411764, 1)
local green = Color(0.9019607843137255, 1.0, 0.3176470588235294, 1)
local SetSpendItemRenderer = function(spendList, cost)
  function spendList.itemRenderer(i, gcmp)
    local str = cost[i + 1]
    
    local splits = Split(str, ":")
    local id = tonumber(splits[2])
    local val = tonumber(splits[3])
    local enough = val <= ActorData.GetItemCount(id)
    UIUtil.SetIconById(gcmp:GetChild("PicLoader"), id)
    UIUtil.SetText(gcmp, val, "NumberTxt")
    local txt = gcmp:GetChild("NumberTxt")
    txt.color = enough and green or red
    gcmp.onClick:Set(function()
      UIUtil.CommonItemClickCallback(id, ProtoEnum.TUPLE_TYPE.ITEM)
    end)
  end
  
  spendList.numItems = #cost
end
local GetOrCreateHolder = function(parent, name, index)
  local holder = parent:GetChild(name)
  if not holder then
    holder = CS.FairyGUI.UIObjectFactory.NewObject(CS.FairyGUI.ObjectType.Graph)
    if index then
      parent:AddChildAt(holder, index)
    else
      parent:AddChild(holder)
    end
    holder.name = name
    UIUtil.SetHolderCenter(holder)
  end
  return holder
end
local levelUpTweener
local PlayMainSealLevelUpAnimation = function(jobIndex, oldLevel, level, threshold, callback, duration, playLevelUpEffect)
  if levelUpTweener then
    return false
  end
  local panel = uis.Main.SealRegion
  local levelRegion = panel.LevelRegion
  local bar = levelRegion.ExpProgressBar
  if playLevelUpEffect then
    local pre = SealData.GetMainSealLevelUpConfig(jobIndex, oldLevel)
    local cur = SealData.GetMainSealLevelUpConfig(jobIndex, level)
    local preAttr = {}
    for i, v in ipairs(pre.add_attr) do
      local splits = Split(v, ":")
      local id = tonumber(splits[2])
      local val = tonumber(splits[3])
      preAttr[id] = val
    end
    local changedIndexes = {}
    for i, v in ipairs(cur.add_attr) do
      local splits = Split(v, ":")
      local id = tonumber(splits[2])
      local val = tonumber(splits[3])
      if preAttr[id] and val > preAttr[id] then
        table.insert(changedIndexes, i)
      end
    end
    local attributeList = levelRegion.AttributeRegion.AttributeList
    SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/ui_yuantu_honor_lvup")
    if level == threshold then
      SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/ui_yuantu_holy_reward")
    end
    for _, v in ipairs(changedIndexes) do
      local child = attributeList:GetChildAt(v - 1)
      local holder = child:GetChild("EffectHolder")
      UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/Engraving/FX_ui_engraving_levelup.prefab", holder, nil, true)
    end
  end
  local transition = bar:GetTransition("up")
  levelUpTweener = bar:TweenValue(100 * ((level - 1) / (threshold - 1)), duration or 0.1):OnComplete(function()
    levelUpTweener = nil
    UIUtil.SetText(bar, level, "LevelTxt")
    UIUtil.SetText(bar, level, "LevelAniTxt")
    transition:Play(callback)
  end)
  return true
end
local CheckCostEnough = function(costStrs, broadcastWhenCoinNotEnough)
  local result = true
  for i, v in ipairs(costStrs) do
    local splits = Split(v, ":")
    local itemId = tonumber(splits[2])
    local count = tonumber(splits[3])
    if count > ActorData.GetItemCount(itemId) then
      if COMMON_ITEM_ID.GAME_COIN == itemId and broadcastWhenCoinNotEnough and SignService.EnterUiReq then
        SignService.EnterUiReq(ProtoEnum.UI_TYPE.UI_LEVELUP_NO_ITEM)
      end
      result = false
      break
    end
  end
  return result
end
local GetMainSealTitle = function(jobIndex, level, quality)
  local prefix = T(20699 + quality)
  local suffix
  if quality > 0 then
    local conf = SealData.GetMainSealQualityUpConfig(jobIndex, quality - 1)
    suffix = level - conf.level_max
  else
    suffix = level
  end
  if suffix <= 0 then
    return prefix
  end
  return prefix
end
local JOB_NAME_LOOKUP = {
  [1] = T(219),
  [2] = T(221),
  [4] = T(227),
  [5] = T(225)
}
local waitMsg

local function RefreshMainSealPanel(jobIndex, mainSealTabIndex, amplifyTabUnlockEffect)
  jobIndex = jobIndex or selectedTabIndex
  local tabIndex = mainSealTabIndex or selectedMainSealTabIndex or 1
  local panel = uis.Main.SealRegion
  local firstEnterAmplifyPanel
  if tabIndex > 1 then
    firstEnterAmplifyPanel = PlayerPrefsUtil.GetInt(PLAYER_PREF_ENUM.ENTER_MAIN_SEAL_AMPLIFY_PANEL, -1) < 0
    PlayerPrefsUtil.SetInt(PLAYER_PREF_ENUM.ENTER_MAIN_SEAL_AMPLIFY_PANEL, 1)
  end
  panel.c1Ctr.selectedIndex = tabIndex - 1
  selectedMainSealTabIndex = tabIndex
  local assetTipsList = panel.AssetsTipsList
  local forgeRegion = panel.ForgeRegion
  local levelRegion = panel.LevelRegion
  local tabList = panel.TabList
  if amplifyTabUnlockEffect then
    local child = tabList:GetChildAt(1)
    if child then
      local holder = GetOrCreateHolder(child, "EFFECT_HOLDER")
      UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/Engraving/FX_ui_engraving_gain_unlock.prefab", holder, nil, true)
    end
  end
  if tabList.selectedIndex ~= tabIndex - 1 then
    tabList.selectedIndex = tabIndex - 1
  end
  local configs = SealData.GetSealJobConfigs()
  local config = configs[jobIndex]
  local jobType = config.job
  local sealInfo = SealData.GetEquippedSealsInfoByJob(jobType)
  local mainSealLevel = math.max(1, sealInfo.bigSealLevel)
  local mainSealQuality = math.max(0, sealInfo.bigSealQuality)
  local mainSealForge = math.max(1, sealInfo.bigSealAddUpLevel)
  local forgeConfig = SealData.GetMainSealForgeUpConfig(jobIndex, mainSealForge)
  forgeRegion.Pic.c1Ctr.selectedIndex = jobType - 1
  local levelConfig = SealData.GetMainSealLevelUpConfig(jobIndex, mainSealLevel)
  local qualityConfig = SealData.GetMainSealQualityUpConfig(jobIndex, mainSealQuality)
  local threshold = qualityConfig.level_max
  local lvmax = mainSealLevel == threshold
  local level_add_attr = levelConfig.add_attr
  local quality_add_attr = qualityConfig.add_attr
  local attributeList = levelRegion.AttributeRegion.AttributeList
  local nextQualityConfig = SealData.GetMainSealQualityUpConfig(jobIndex, mainSealQuality + 1)
  if lvmax and not nextQualityConfig then
    levelRegion.levelmaxCtr.selectedIndex = 1
    levelRegion.breachCtr.selectedIndex = 0
  else
    levelRegion.levelmaxCtr.selectedIndex = 0
    levelRegion.breachCtr.selectedIndex = lvmax and 1 or 0
    levelRegion.AttributeRegion.BreachUp.Number1Txt.text = threshold
    SetSpendItemRenderer(levelRegion.SpendList, lvmax and qualityConfig.cost or levelConfig.cost)
    if lvmax then
      levelRegion.AttributeRegion.BreachUp.Number2Txt.text = nextQualityConfig.level_max
    end
  end
  
  function attributeList.itemRenderer(i, gcmp)
    local level_add_str = level_add_attr[i + 1]
    local splits = Split(level_add_str, ":")
    local id = tonumber(splits[2])
    local val = tonumber(splits[3])
    for _, v in ipairs(quality_add_attr) do
      local strs = Split(v, ":")
      if strs[2] == splits[2] then
        val = val + tonumber(strs[3])
        break
      end
    end
    local attrName = TableData.GetConfig(id, "BaseAttribute").display_name()
    UIUtil.SetText(gcmp, attrName, "NameTxt")
    if id == ProtoEnum.ATTR_ID.ATK then
      ChangeUIController(gcmp, "c1", 0)
    elseif id == ProtoEnum.ATTR_ID.DEF then
      ChangeUIController(gcmp, "c1", 1)
    elseif id == ProtoEnum.ATTR_ID.MAX_HP then
      ChangeUIController(gcmp, "c1", 2)
    end
    if lvmax and nextQualityConfig then
      ChangeUIController(gcmp, "breach", 1)
      UIUtil.SetText(gcmp, val, "Number1Txt")
      local newVal = tonumber(splits[3])
      for _, v in ipairs(nextQualityConfig.add_attr) do
        local strs = Split(v, ":")
        if strs[2] == splits[2] then
          newVal = newVal + tonumber(strs[3])
          break
        end
      end
      UIUtil.SetText(gcmp, newVal, "Number2Txt")
    else
      ChangeUIController(gcmp, "breach", 0)
      UIUtil.SetText(gcmp, val, "Number2Txt")
    end
  end
  
  attributeList.numItems = #level_add_attr
  attributeList = forgeRegion.PartAttributeRegion.PartAttributeList
  local equippedSealInfo = SealData.GetEquippedSealsInfoByJob(jobType)
  local seals = equippedSealInfo and equippedSealInfo.sealIds
  local attributes
  local numSeals = 3
  if seals and _G.next(seals) then
    attributes = {}
    for _, sealId in ipairs(seals) do
      local conf = TableData.GetConfig(sealId, "BaseSeal")
      for _, str in ipairs(conf.value) do
        local splits = Split(str, ":")
        local id, val = tonumber(splits[2]), tonumber(splits[3])
        local k = table.keyof(attributes, id, "id")
        if k then
          attributes[k].val = attributes[k].val + val
        else
          table.insert(attributes, {
            id = id,
            val = val,
            attr_type = conf.attr_type,
            sealId = sealId
          })
        end
      end
    end
    table.sort(attributes, function(x, y)
      return x.attr_type < y.attr_type
    end)
  end
  
  function attributeList.itemRenderer(i, gcmp)
    local index = i + 1
    local loader = gcmp:GetChild("PicLoader")
    if attributes and index <= #attributes then
      local entry = attributes[index]
      local sealId = entry.sealId
      ChangeUIController(gcmp, "c1", entry.attr_type - 1)
      local sealConf = TableData.GetConfig(sealId, "BaseSeal")
      local addition = math.floor(entry.val * forgeConfig.add_attr / 10000)
      local valText = addition > 0 and string.format("%s [color=#40b5ff]+%s[/color]", entry.val, addition) or entry.val
      UIUtil.SetText(gcmp, valText, "Number2Txt")
      UIUtil.SetText(gcmp, LevelText(16, 26, sealConf.level), "NameTxt")
      UIUtil.SetIconById(loader, sealId)
      ChangeUIController(gcmp, "c2", 0)
    else
      if 0 == i then
        ChangeUIController(gcmp, "c1", 0)
      elseif 1 == i then
        ChangeUIController(gcmp, "c1", 2)
      elseif 2 == i then
        ChangeUIController(gcmp, "c1", 1)
      end
      ChangeUIController(gcmp, "c2", 1)
      UIUtil.SetText(gcmp, T(20716), "Number2Txt")
      UIUtil.SetText(gcmp, "", "NameTxt")
      loader.url = nil
    end
  end
  
  attributeList.numItems = numSeals
  local nextForgeUpConfig = SealData.GetMainSealForgeUpConfig(jobIndex, mainSealForge + 1)
  if not nextForgeUpConfig then
    forgeRegion.forgemaxCtr.selectedIndex = 1
  else
    forgeRegion.forgemaxCtr.selectedIndex = 0
    SetSpendItemRenderer(forgeRegion.SpendList, forgeConfig.cost)
  end
  local assets = {}
  if 1 == tabIndex then
    if lvmax and nextQualityConfig then
      if qualityConfig.cost then
        for i, v in ipairs(qualityConfig.cost) do
          local itemId = tonumber(Split(v, ":")[2])
          if not table.keyof(assets, itemId) then
            table.insert(assets, itemId)
          end
        end
      end
    elseif levelConfig.cost then
      for i, v in ipairs(levelConfig.cost) do
        local itemId = tonumber(Split(v, ":")[2])
        if not table.keyof(assets, itemId) then
          table.insert(assets, itemId)
        end
      end
    end
  elseif forgeConfig.cost then
    for i, v in ipairs(forgeConfig.cost) do
      local itemId = tonumber(Split(v, ":")[2])
      if not table.keyof(assets, itemId) then
        table.insert(assets, itemId)
      end
    end
  end
  UIUtil.InitAssetsTips(assetTipsList, assets)
  assetTipsList.opaque = false
  local expProgressBar = levelRegion.ExpProgressBar
  expProgressBar.value = (mainSealLevel - 1) / (threshold - 1) * 100
  UIUtil.SetText(expProgressBar, threshold, "Level1Txt")
  UIUtil.SetText(expProgressBar, mainSealLevel, "LevelTxt")
  UIUtil.SetText(expProgressBar, mainSealLevel, "LevelAniTxt")
  local levelUpText = T(20690)
  local qualityUpText = T(20691)
  local forgeUpText = T(20692)
  local levelMaxText = T(20693)
  local breakthroughText = T(20694)
  UIUtil.SetText(levelRegion.UpBtn, lvmax and qualityUpText or levelUpText)
  levelRegion.Breach.WordTxt.text = GetMainSealTitle(jobIndex, mainSealLevel, mainSealQuality)
  levelRegion.AttributeRegion.BreachUp.NameTxt.text = breakthroughText
  levelRegion.Max.WordTxt.text = levelMaxText
  ChangeUIController(levelRegion.Breach.root, "c1", qualityConfig.show_type)
  uis.Main.EquipmentRegion.Breach.c1Ctr.selectedIndex = qualityConfig.show_type
  uis.Main.EquipmentRegion.Breach.WordTxt.text = GetMainSealTitle(jobIndex, mainSealLevel, mainSealQuality)
  local forgeText = string.format("+%s", mainSealForge)
  local forgeMaxText = T(20695)
  local addition = string.format("%s%%", math.floor(forgeConfig.add_attr * 100 / 10000))
  local forgeAdditionText = T(20696, JOB_NAME_LOOKUP[jobType], addition)
  local firstLockText = T(20697)
  local unlockForgeText = T(20698, GetMainSealTitle(jobIndex, forgeConfig.level_condition, Mathf.FloorToInt(forgeConfig.level_condition / 10)))
  UIUtil.SetText(forgeRegion.Number.root, forgeText, "Number1Txt")
  UIUtil.SetText(forgeRegion.Number.root, forgeText, "Number2Txt")
  UIUtil.SetText(forgeRegion.UpBtn, forgeUpText)
  forgeRegion.PartAttributeRegion.WordTxt.text = forgeAdditionText
  forgeRegion.Max.WordTxt.text = forgeMaxText
  local unlock = mainSealLevel >= forgeConfig.level_condition
  forgeRegion.lockCtr.selectedIndex = unlock and 0 or firstEnterAmplifyPanel and 1 or 2
  forgeRegion.FirstLock.Word1Txt.text = firstLockText
  forgeRegion.FirstLock.Word2Txt.text = unlockForgeText
  forgeRegion.LimitLock.WordTxt.text = unlockForgeText
  local func = function()
    if waitMsg then
      return
    end
    if lvmax then
      if qualityConfig.cost and not CheckCostEnough(qualityConfig.cost) then
        FloatTipsUtil.ShowWarnTips(T(20710))
        return
      end
      waitMsg = true
      SealService.MainSealBreakthroughReq(jobType, function()
        waitMsg = false
        RefreshMainSealPanel(selectedTabIndex, selectedMainSealTabIndex)
        RefreshAttributeAdditions(jobIndex)
        uis.root.touchable = false
        SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/sfx_ui_keyin_damo")
        LeanTween.delayedCall(0.2, function()
          OpenWindow(WinResConfig.MainSealLevelUpTipsWindow.name, nil, jobIndex, false)
          uis.root.touchable = true
        end)
      end)
    else
      if not CheckCostEnough(levelConfig.cost, true) then
        FloatTipsUtil.ShowWarnTips(T(20711))
        return
      end
      waitMsg = true
      local level = SealData.GetEquippedSealsInfoByJob(jobType).bigSealLevel
      local upvalue = level
      local targetLevel = math.min(level + 1, threshold)
      SealService.MainSealLevelUpReq(jobType, targetLevel, function()
        PlayMainSealLevelUpAnimation(jobIndex, upvalue, targetLevel, threshold, function()
          RefreshMainSealPanel(selectedTabIndex, selectedMainSealTabIndex)
          RefreshAttributeAdditions(jobIndex)
          waitMsg = false
        end, nil, true)
      end)
    end
  end
  local gesture = LongPressGesture.GetLongPressGesture(levelRegion.UpBtn)
  gesture.trigger = 0.5
  local interval = 0.125
  gesture.interval = interval
  local targetLevel = mainSealLevel
  gesture.onBegin:Set(function(context)
    Stage.inst:CancelClick(context.inputEvent.touchId)
  end)
  gesture.onAction:Set(function()
    if targetLevel >= threshold then
      return
    end
    if not CheckCostEnough(levelConfig.cost, true) then
      FloatTipsUtil.ShowWarnTips(T(20711))
      return
    end
    local bar = levelRegion.ExpProgressBar
    local txt = bar:GetChild("LevelTxt")
    local nowLevel = tonumber(txt.text)
    targetLevel = math.min(targetLevel + 1, threshold)
    if nowLevel < targetLevel then
      PlayMainSealLevelUpAnimation(jobIndex, nowLevel, nowLevel + 1, threshold, function()
        RefreshMainSealPanel(selectedTabIndex, selectedMainSealTabIndex)
        RefreshAttributeAdditions(jobIndex)
      end, interval, true)
    end
    if not waitMsg then
      local upvalueTargetLevel = targetLevel
      if targetLevel > SealData.GetEquippedSealsInfoByJob(jobType).bigSealLevel then
        waitMsg = true
        SealService.MainSealLevelUpReq(jobType, targetLevel, function(msg)
          waitMsg = false
          if not levelUpTweener then
            PlayMainSealLevelUpAnimation(jobIndex, nowLevel, upvalueTargetLevel, threshold, function()
              RefreshMainSealPanel(selectedTabIndex, selectedMainSealTabIndex)
              RefreshAttributeAdditions(jobIndex)
            end, interval, true)
          end
        end)
      end
    end
  end)
  levelRegion.UpBtn.onClick:Set(func)
  forgeRegion.UpBtn.onClick:Set(function()
    if waitMsg then
      return
    end
    if not CheckCostEnough(forgeConfig.cost) then
      FloatTipsUtil.ShowWarnTips(T(20712))
      return
    end
    waitMsg = true
    SealService.MainSealAmplifyReq(jobType, function()
      waitMsg = false
      RefreshMainSealPanel(selectedTabIndex, selectedMainSealTabIndex)
      RefreshAttributeAdditions(jobIndex)
      local amplifyHolder = GetOrCreateHolder(forgeRegion.Pic.root, "EFFECT_HOLDER")
      UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/Engraving/FX_ui_engraving_midlevelup.prefab", amplifyHolder, nil, true)
      SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/ui_yuantu_holy_reward")
    end)
  end)
  RedDotMgr.UpdateNodeByWindowName(WinResConfig.SealWindow.name)
end

local SelectTab = function(index)
  if tweeners and #tweeners > 0 then
    return
  end
  local configs = SealData.GetSealJobConfigs()
  local panel = uis.Main.EquipmentRegion
  local config = configs[index]
  local jobType = config.job
  panel.c1Ctr.selectedIndex = jobType - 1
  local tablist = uis.Main.TabList
  tablist.selectedIndex = index - 1
  selectedTabIndex = index
  if tweenerCollection then
    for i, v in ipairs(tweenerCollection) do
      LeanTween.cancel(v)
    end
    table.clear(tweenerCollection)
  end
  local path = BG_EFFECT_LOOKUP[jobType]
  local holder = uis.Main.EquipmentRegion.Effect1Holder
  UIUtil.SetHolderCenter(holder)
  holder.y = 315
  local effect = ResourceManager.Instantiate(path)
  UIUtil.SetObjectToUI(effect, holder)
  for i = 1, 3 do
    RefreshEquippedSeals(index, i)
    local name = string.format("Slot%sBtn", i)
    local cmp = panel[name]
    cmp.mode = FairyGUI.ButtonMode.Check
    if selectedAttrType then
      local selectedSlotIndex = table.keyof(config.holes, selectedAttrType)
      ChangeUIController(cmp, "button", selectedSlotIndex and selectedSlotIndex == i and 1 or 0)
    else
      ChangeUIController(cmp, "button", 0)
    end
    local attr_type = config.holes[i]
    cmp.onClick:Set(function(context)
      context:StopPropagation()
      for j = 1, 3 do
        local subname = string.format("Slot%sBtn", j)
        ChangeUIController(panel[subname], "button", j == i and 1 or 0)
      end
      local equipped = SealMgr.IsEquipped(jobType, attr_type)
      if equipped and selectedAttrType == attr_type and selectedTabIndex == index and 1 == uis.Main.c1Ctr.selectedIndex then
        SealService.TakeoffSealReq(jobType, equipped, function()
          RefreshEquippedSeals(index, i)
          RefreshUnequippedSeals(index, attr_type, true)
          RefreshAttributeAdditions(index)
          RedDotMgr.UpdateNodeByWindowName(WinResConfig.SealWindow.name)
        end)
      end
      RefreshUnequippedSeals(index, attr_type, true)
      selectedAttrType = attr_type
      uis.Main.c1Ctr.selectedIndex = 1
    end)
    local gesture = CS.FairyGUI.LongPressGesture.GetLongPressGesture(cmp)
    gesture.trigger = 0.2
    gesture.onBegin:Set(function(context)
      Stage.inst:CancelClick(context.inputEvent.touchId)
      local equipped = SealMgr.IsEquipped(jobType, attr_type)
      if equipped then
        OpenWindow(WinResConfig.SealGetTipsWindow.name, nil, {id = equipped, notShowWay = false})
      end
    end)
  end
  panel.root.onClick:Set(function()
    if EnterClampUtil.WhetherToEnter(FEATURE_ENUM.SEAL_EXPAND, true) then
      uis.Main.c1Ctr.selectedIndex = 2
      RefreshMainSealPanel(index)
    end
  end)
  if EnterClampUtil.WhetherToEnter(FEATURE_ENUM.SEAL_EXPAND, false) then
    RefreshMainSealPanel(index, selectedMainSealTabIndex)
    uis.Main.EquipmentRegion.c3Ctr.selectedIndex = 1
    uis.Main.EquipmentRegion.c4Ctr.selectedIndex = 1
  else
    uis.Main.EquipmentRegion.c3Ctr.selectedIndex = 0
    uis.Main.EquipmentRegion.c4Ctr.selectedIndex = 0
  end
  RefreshUnequippedSeals(index, selectedAttrType or config.holes[1], true)
  RefreshAttributeAdditions(index)
end

function SealWindow.ReInitData()
end

function SealWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.SealWindow.package, WinResConfig.SealWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetExploreDevelop_DevelopWindowUis(contentPane)
    SealService.GetEquippedSealInfoReq(function()
      SealWindow.UpdateInfo()
      SealWindow.InitBtn()
    end)
  end)
end

function SealWindow.UpdateInfo()
  local wearRegion = uis.Main.WearRegion.root
  local sealRegion = uis.Main.SealRegion.root
  wearRegion.sortingOrder = 10
  sealRegion.sortingOrder = 10
  uis.Main.CurrencyReturn.root.sortingOrder = 15
  local configs = SealData.GetSealJobConfigs()
  local tablist = uis.Main.TabList
  
  function tablist.itemRenderer(i, gcmp)
    local tabIndex = i + 1
    local config = configs[tabIndex]
    ChangeUIController(gcmp, "c1", config.job - 1)
    gcmp.onClick:Set(function()
      if tabIndex ~= selectedTabIndex then
        SelectTab(tabIndex)
      end
    end)
  end
  
  tablist.numItems = #configs
  for i = 0, tablist.numChildren - 1 do
    RedDotMgr.AddNode({
      windowName = WinResConfig.SealWindow.name,
      com = tablist:GetChildAt(i),
      visibleFunc = function()
        return RedDotSeal.HasAnyAvailableSlotByJobType(configs[i + 1].job)
      end,
      dataType = RED_DOT_DATA_TYPE.SEAL
    })
  end
  local index = 1
  selectedMainSealTabIndex = 1
  SelectTab(index)
  tablist = uis.Main.SealRegion.TabList
  
  function tablist.itemRenderer(i, gcmp)
    ChangeUIController(gcmp, "c1", i)
    UIUtil.SetText(gcmp, T(20717 + i))
    local unlock = true
    if i > 0 then
      unlock = EnterClampUtil.WhetherToEnter(FEATURE_ENUM.SEAL_EXPAND_AMPLIFY, false)
    end
    ChangeUIController(gcmp, "lock", unlock and 0 or 1)
    gcmp.onClick:Set(function()
      if i > 0 and EnterClampUtil.WhetherToEnter(FEATURE_ENUM.SEAL_EXPAND_AMPLIFY, true) then
        RefreshMainSealPanel(selectedTabIndex, i + 1)
      elseif 0 == i then
        RefreshMainSealPanel(selectedTabIndex, i + 1)
      end
    end)
  end
  
  tablist.numItems = 1
  RedDotMgr.AddNode({
    windowName = WinResConfig.SealWindow.name,
    com = tablist:GetChildAt(0),
    visibleFunc = function()
      return RedDotSeal.MainSealCanUpgrade(selectedTabIndex) or RedDotSeal.MainSealCanBreakthrough(selectedTabIndex)
    end,
    dataType = RED_DOT_DATA_TYPE.SEAL
  })
  UIUtil.SetBtnText(uis.Main.SynthesisBtn, T(20573))
  RedDotMgr.UpdateNodeByWindowName(WinResConfig.SealWindow.name)
end

function SealWindow.InitBtn()
  local detailBtn = uis.Main.CurrencyReturn.FunctionDetailsBtn
  local featureId = FEATURE_ENUM.SEAL_MAIN
  if EnterClampUtil.WhetherToEnter(FEATURE_ENUM.SEAL_EXPAND, false) then
    featureId = FEATURE_ENUM.SEAL_EXPAND
  end
  local data = TableData.GetConfig(featureId, "BaseFeature")
  local detailFunc, firstUnlockSealExpand
  if EnterClampUtil.WhetherToEnter(FEATURE_ENUM.SEAL_EXPAND, false) then
    local entered = PlayerPrefsUtil.GetInt(PLAYER_PREF_ENUM.ENTER_MAIN_SEAL_PANEL, 0)
    PlayerPrefsUtil.SetInt(PLAYER_PREF_ENUM.ENTER_MAIN_SEAL_PANEL, 1)
    firstUnlockSealExpand = entered <= 0
  end
  if data and data.caption_id then
    function detailFunc()
      WindowLoadPackages[WinResConfig.GuidePicLookWindow.name] = {
        "Guide_" .. Language.curLanguage
      }
      OpenWindow(WinResConfig.GuidePicLookWindow.name, nil, data.caption_id, nil, true)
    end
    
    detailBtn.visible = true
  else
    detailBtn.visible = false
  end
  CurrencyReturnWindow.SetCurrencyReturn(WinResConfig.SealWindow.name, uis.Main.CurrencyReturn, featureId, nil, nil, detailFunc)
  if EnterClampUtil.WhetherToEnter(featureId, false) and data.auto_open_caption and GuideData.CanShowCaption(data.id) then
    uis.root.touchable = false
    if firstUnlockSealExpand then
      firstUnlockSealExpand = false
      local holder = uis.Main.EquipmentRegion.Effect2Holder
      holder.sortingOrder = 30
      SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/sfx_ui_keyin_show")
      UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/Engraving/FX_ui_engraving_midunlock.prefab", holder, nil, true, function()
        LeanTween.delayedCall(data.caption_time and data.caption_time or 0.25, function()
          detailBtn.onClick:Call()
          uis.root.touchable = true
        end)
      end)
    else
      LeanTween.delayedCall(data.caption_time and data.caption_time or 0.25, function()
        detailBtn.onClick:Call()
        uis.root.touchable = true
      end)
    end
    GuideData.SaveCaptionOpen(data.id)
  end
  if firstUnlockSealExpand then
    local holder = uis.Main.EquipmentRegion.Effect2Holder
    holder.sortingOrder = 30
    SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/sfx_ui_keyin_show")
    UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/Engraving/FX_ui_engraving_midunlock.prefab", holder, nil, true)
  end
  uis.Main.SynthesisBtn.onClick:Set(function()
    local jobType = SealData.GetSealJobConfigs()[selectedTabIndex].job
    OpenWindow(WinResConfig.SealSynthesisWindow.name, nil, jobType)
  end)
  uis.Main.EquipmentRegion.PopupCloseBtn.onClick:Set(function(context)
    context:StopPropagation()
    local areaRoot = uis.Main.EquipmentRegion.root
    local localPosition = areaRoot:GlobalToLocal(context.inputEvent.position)
    if 2 ~= uis.Main.c1Ctr.selectedIndex and localPosition.x > 0 and localPosition.x < areaRoot.width and localPosition.y > 0 and localPosition.y < areaRoot.height and EnterClampUtil.WhetherToEnter(FEATURE_ENUM.SEAL_EXPAND, false) then
      uis.Main.c1Ctr.selectedIndex = 2
      RefreshMainSealPanel(selectedTabIndex, selectedMainSealTabIndex)
    else
      uis.Main.c1Ctr.selectedIndex = 0
      selectedAttrType = nil
    end
    for i = 1, 3 do
      local name = string.format("Slot%sBtn", i)
      local panel = uis.Main.EquipmentRegion
      local cmp = panel[name]
      ChangeUIController(cmp, "button", 0)
    end
  end)
end

function SealWindow.OnShown()
  if UIMgr:IsShowFromHide(WinResConfig.SealWindow.name) then
    SelectTab(selectedTabIndex or 1)
  end
end

function SealWindow.OnClose()
  uis = nil
  contentPane = nil
  selectedTabIndex = nil
  selectedAttrType = nil
  if tweeners then
    for _, v in ipairs(tweeners) do
      LeanTween.cancel(v)
    end
    table.clear(tweeners)
  end
  levelUpTweener = nil
  waitMsg = false
  RedDotMgr.RemoveNode(WinResConfig.SealWindow.name)
end

function SealWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.SealWindow.CHANGE_SELECTED_TAB then
    if type(para) == "number" and para > 0 and para < 5 then
      if para ~= selectedTabIndex then
        selectedAttrType = nil
      end
      selectedTabIndex = para
    end
  elseif msgId == WindowMsgEnum.SealWindow.PLAY_BREAKTHROUGH_EFFECT then
    local path = "Assets/Art/Effects/Prefab/UI_prefab/Engraving/FX_ui_engraving_rankup_light.prefab"
    UIUtil.SetEffectToUI(path, GetOrCreateHolder(uis.Main.SealRegion.LevelRegion.Breach.root, "EFFECT_HOLDER"), nil, true)
    UIUtil.SetEffectToUI(path, GetOrCreateHolder(uis.Main.EquipmentRegion.Breach.root, "EFFECT_HOLDER"), nil, true)
  end
end

return SealWindow
