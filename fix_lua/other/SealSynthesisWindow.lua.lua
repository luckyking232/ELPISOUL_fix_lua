require("ExploreDevelop_SynthesisWindowByName")
local SealSynthesisWindow = {}
local uis, RefreshPanelInfo, AutoAdd, contentPane, jobType, tweenerCollection, max, lucky, selectedSlotIndex
local currentSeal, combinedCount = nil, 0
local wait
local IsEmpty = function()
  return nil == currentSeal
end
local HasSeal = function(index)
  if currentSeal then
    local itemId = currentSeal.itemId
    local cnt = ActorData.GetItemCount(itemId)
    return index <= cnt and currentSeal or nil
  end
  return false
end
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
local LevelText = function(lv_size1, lv_size2, lv_val)
  return string.format("Lv.%s", lv_val)
end
local RefreshSynthesisSlot = function()
  local totalCnt = 2
  local count = 0
  if currentSeal then
    totalCnt = 2
    count = combinedCount
  end
  local redText = "[color=#ff6678]%s[/color]/%s"
  local greenText = "[color=#e6ff51]%s[/color]/%s"
  uis.Main.MidRegion.NumberTxt.text = string.format(count >= 2 and greenText or redText, count, totalCnt)
  local slot = uis.Main.MidRegion.Slot3Btn
  local loader = slot:GetChild("PicLoader")
  if currentSeal then
    local conf = TableData.GetConfig(currentSeal.itemId, "BaseSeal")
    local sealId = conf.next_seal_id
    local targetConf = TableData.GetConfig(sealId, "BaseSeal")
    local itemConf = TableData.GetConfig(sealId, "BaseItem")
    local level = targetConf.level
    UIUtil.SetText(slot, LevelText(16, 26, level), "LevelTxt")
    UIUtil.SetIconById(loader, sealId)
    ChangeUIController(slot, "c2", 1)
    ChangeUIController(slot, "color", itemConf.quality)
  else
    loader.url = nil
    ChangeUIController(slot, "c2", 0)
  end
end
local RefreshSlotSeal = function(i)
  local panel = uis.Main.MidRegion
  local name = string.format("Slot%sBtn", i)
  local slotbtn = panel[name]
  local loader = slotbtn:GetChild("PicLoader")
  local equipped = HasSeal(i)
  if equipped then
    local itemId = equipped.itemId
    local sealConf = TableData.GetConfig(itemId, "BaseSeal")
    local level = sealConf.level
    UIUtil.SetText(slotbtn, LevelText(16, 26, level), "LevelTxt")
    UIUtil.SetIconById(loader, itemId)
  else
    loader.url = nil
  end
  ChangeUIController(slotbtn, "c2", equipped and 1 or 0)
end
local RefreshAllSlotSeals = function()
  for i = 1, 2 do
    local panel = uis.Main.MidRegion
    local name = string.format("Slot%sBtn", i)
    local slotbtn = panel[name]
    local loader = slotbtn:GetChild("PicLoader")
    local equipped = HasSeal(i)
    if equipped then
      local itemId = equipped.itemId
      local sealConf = TableData.GetConfig(itemId, "BaseSeal")
      local itemConf = TableData.GetConfig(itemId, "BaseItem")
      local level = sealConf.level
      UIUtil.SetText(slotbtn, LevelText(16, 26, level), "LevelTxt")
      UIUtil.SetIconById(loader, itemId)
      ChangeUIController(slotbtn, "color", itemConf.quality)
    else
      loader.url = nil
    end
    ChangeUIController(slotbtn, "c2", equipped and 1 or 0)
  end
  RefreshSynthesisSlot()
end
local GetCurrentSuccessProbability = function(use_lucky)
  local result = 0
  if currentSeal then
    local conf = TableData.GetConfig(currentSeal.itemId, "BaseSeal")
    result = math.floor((conf.pro + (use_lucky and conf.add_pro or 0)) / 10000 * 100)
  end
  return result
end
local valTweener, currentProbability
local RefreshConsume = function()
  local panel = uis.Main.RightRegion
  local spend = panel.Spend.Spend
  local redText = "[color=#ff6678]%s[/color]/%s"
  if valTweener then
    LeanTween.cancel(valTweener)
  end
  if IsEmpty() then
    spend.NumberTxt.text = nil
    spend.WordTxt.text = nil
    panel.ProbabilityTxt.text = "-%"
    uis.Main.RightRegion.c1Ctr.selectedIndex = 0
    spend.PicLoader.url = nil
    ChangeUIController(uis.Main.RightRegion.root, "c2", 1)
    panel.WordTxt.text = T(20590)
    currentProbability = 0
    return
  end
  spend.WordTxt.text = T(20577)
  panel.WordTxt.text = T(20575)
  local seal = currentSeal
  local conf = TableData.GetConfig(seal.itemId, "BaseSeal")
  local splits = Split(conf.cost[1], ":")
  local costItemId, costVal = tonumber(splits[2]), tonumber(tonumber(splits[3]))
  local totalCost = costVal * math.max(combinedCount, 2) * 0.5
  spend.NumberTxt.text = math.floor(totalCost)
  if totalCost > ActorData.GetItemCount(costItemId) then
    panel.Spend.c1Ctr.selectedIndex = 1
  else
    panel.Spend.c1Ctr.selectedIndex = 0
  end
  UIUtil.SetIconById(spend.PicLoader, costItemId)
  if conf.cost_lucky then
    splits = Split(conf.cost_lucky[1], ":")
    local itemId, count = tonumber(splits[2]), tonumber(tonumber(splits[3]))
    local greenText = "[color=#e6ff51]%s[/color]/%s"
    local totalCount = math.floor(math.max(combinedCount, 2) * count * 0.5)
    local ownCnt = ActorData.GetItemCount(itemId)
    local enough = totalCount <= ownCnt
    UIUtil.SetIconById(panel.ItemBtn:GetChild("PicLoader"), itemId)
    UIUtil.SetText(panel.ItemBtn, TableData.GetConfig(itemId, "BaseItem").name(), "NameTxt")
    UIUtil.SetText(panel.ItemBtn, string.format(enough and greenText or redText, ownCnt, totalCount), "NumberTxt")
    if not enough then
      uis.Main.RightRegion.c1Ctr.selectedIndex = 0
    end
    ChangeUIController(uis.Main.RightRegion.root, "c2", 0)
    uis.Main.RightRegion.ItemBtn.onClick:Set(function()
      if currentSeal then
        local selectedIndex = uis.Main.RightRegion.c1Ctr.selectedIndex
        local ownCnt = ActorData.GetItemCount(itemId)
        local enough = ownCnt >= totalCount
        if not enough then
          FloatTipsUtil.ShowWarnTips(T(7001200))
          uis.Main.RightRegion.c1Ctr.selectedIndex = 0
          return
        end
      end
    end)
    local targetVal
    if lucky then
      targetVal = math.floor((conf.pro + conf.add_pro) / 10000 * 100)
    else
      targetVal = math.floor(conf.pro / 10000 * 100)
    end
    local start = currentProbability or 0
    currentProbability = targetVal
    valTweener = LeanTween.value(start, targetVal, 0.3):setOnUpdate(function(val)
      panel.ProbabilityTxt.text = string.format("%s%%", math.floor(val))
    end):setOnComplete(function()
      panel.ProbabilityTxt.text = string.format("%s%%", currentProbability)
      valTweener = nil
    end).id
  else
    uis.Main.RightRegion.c1Ctr.selectedIndex = 0
    ChangeUIController(uis.Main.RightRegion.root, "c2", 1)
    local targetVal = math.floor(conf.pro / 10000 * 100)
    local start = currentProbability or 0
    currentProbability = targetVal
    valTweener = LeanTween.value(start, targetVal, 0.3):setOnUpdate(function(val)
      panel.ProbabilityTxt.text = string.format("%s%%", math.floor(val))
    end):setOnComplete(function()
      panel.ProbabilityTxt.text = string.format("%s%%", currentProbability)
      valTweener = nil
    end).id
  end
end
local AddSeal = function(itemInfo, ignoreMax, auto)
  if not itemInfo then
    return false
  end
  local itemId = itemInfo.itemId
  if itemId then
    local conf = TableData.GetConfig(itemId, "BaseSeal")
    if type(conf.next_seal_id) ~= "number" then
      return false
    end
  end
  local temp = combinedCount
  if currentSeal and currentSeal.itemId ~= itemId then
    temp = 0
  end
  if ActorData.GetItemCount(itemId) - temp < 2 then
    return false
  end
  combinedCount = temp
  currentSeal = itemInfo
  local addCount = 2
  if not ignoreMax and max then
    local count = ActorData.GetItemCount(itemId)
    addCount = math.floor((count - combinedCount) / 2) * 2
  end
  if auto then
    combinedCount = addCount
  else
    combinedCount = combinedCount + addCount
  end
  return true
end
local RemoveCurrentSeal = function()
  combinedCount = math.max(combinedCount - 2, 2)
  if combinedCount <= 0 then
    currentSeal = nil
  end
end
local ClearCurrentSeal = function()
  currentSeal = nil
  combinedCount = 0
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

local function RefreshUnequippedSeals(slotIndex, playItemAnim, playFoldAnim, refreshData)
  local list = uis.Main.LeftRegion.WearList
  local typeSealsCollection = SealData.GetSeals_JobType_SplitByAttribute(jobType, nil, refreshData, true)
  local nothing = true
  for i, v in ipairs(typeSealsCollection) do
    if v.seals and #v.seals > 0 then
      nothing = false
      break
    end
  end
  uis.Main.c1Ctr.selectedIndex = nothing and 1 or 0
  
  function list.itemRenderer(j, gcmp)
    local foldIndex = j + 1
    local typeSeals = typeSealsCollection[foldIndex]
    local titleBtn = gcmp:GetChild("TitleBtn")
    local seals = typeSeals.seals
    local attr_type = typeSeals.attrType
    local attrName = ATTR_TYPE_LOOKUP[attr_type].name
    local numSeals = #seals
    local totalSeals = 0
    ChangeUIController(titleBtn:GetChild("Attribute"), "c1", attr_type - 1)
    UIUtil.SetText(titleBtn, attrName, "NameTxt")
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
    titleBtn.onClick:Set(function()
      if wait then
        return
      end
      if tweenerCollection and #tweenerCollection > 0 then
        return
      end
      local isUnfold = 0 == itemlist.height
      RefreshUnequippedSeals(foldIndex, isUnfold, true)
      if isUnfold and not nothing then
        AutoAdd()
      end
    end)
    
    function itemlist.itemRenderer(k, subgcmp)
      local subItem = subgcmp:GetChild("DevelopWearItemBtn")
      local itemInfo = seals[k + 1]
      local itemId = itemInfo.itemId
      local sealConf = TableData.GetConfig(itemId, "BaseSeal")
      local itemConf = TableData.GetConfig(itemId, "BaseItem")
      local level = sealConf.level
      local splits = Split(sealConf.value[1], ":")
      local attrName = TableData.GetConfig(tonumber(splits[2]), "BaseAttribute").display_name()
      local addVal = splits[3]
      UIUtil.SetText(subItem, string.format("%s +%s", attrName, addVal), "AttributeTxt")
      local count = itemInfo.count
      if currentSeal then
        ChangeUIController(subItem, "c1", currentSeal.itemId == itemId and 1 or 0)
      else
        ChangeUIController(subItem, "c1", 0)
      end
      ChangeUIController(subItem, "color", itemConf.quality)
      UIUtil.SetText(subItem, count > 999 and "999+" or count, "NumberTxt")
      UIUtil.SetText(subItem, LevelText(16, 22, level), "LevelTxt")
      local loader = subItem:GetChild("PicLoader")
      UIUtil.SetIconById(loader, itemId)
      subgcmp.onClick:Set(function()
        if wait then
          return
        end
        if AddSeal(itemInfo) then
          RefreshPanelInfo(foldIndex)
          for i = 0, itemlist.numChildren - 1 do
            local child = itemlist:GetChildAt(i)
            local subItemBtn = child:GetChild("DevelopWearItemBtn")
            ChangeUIController(subItemBtn, "c1", i == k and 1 or 0)
          end
        elseif 1 == itemInfo.count then
          combinedCount = 1
          currentSeal = itemInfo
          RefreshPanelInfo(foldIndex)
        end
      end)
      local holder = subItem:GetChild("EffectHolder")
      holder.touchable = false
      loader.onClick:Set(function(context)
        context:StopPropagation()
        OpenWindow(WinResConfig.SealGetTipsWindow.name, nil, {id = itemId, notShowWay = false})
      end)
    end
    
    itemlist.numItems = numSeals
    if playItemAnim then
      for k = 0, itemlist.numChildren - 1 do
        local child = itemlist:GetChildAt(k)
        local item = child:GetChild("DevelopWearItemBtn")
        item.alpha = 0
        PlayUITrans(child, "up", nil, (k + 1) * 0.03)
      end
    end
  end
  
  list.numItems = typeSealsCollection and #typeSealsCollection or 0
  list.scrollItemToViewOnClick = false
  if typeSealsCollection then
    local selected = typeSealsCollection[slotIndex]
    local attrType = selected.attrType
    local panel = uis.Main.MidRegion
    for i = 1, 3 do
      local name = string.format("Slot%sBtn", i)
      local slotbtn = panel[name]
      ChangeUIController(slotbtn, "c1", attrType - 1)
    end
  end
  local elementHeight, gap = 86, 1
  if playFoldAnim then
    for k = 1, list.numChildren do
      local child = list:GetChildAt(k - 1)
      local item_list = child:GetChild("ItemList")
      local numChildren = item_list.numChildren
      local duration = math.min(0.3, numChildren * 0.03)
      local current = k == slotIndex
      local isUnfold = item_list.height > 0
      if current then
        if isUnfold then
          Fold(item_list, duration)
          ChangeUIController(child:GetChild("TitleBtn"), "button", 0)
        else
          Unfold(item_list, elementHeight, gap, duration)
          ChangeUIController(child:GetChild("TitleBtn"), "button", 1)
          if currentSeal then
            local parentPosY = list.container.position.y
            local titleHeight, itemHeight, lineGap1, lineGap2 = 44, 86, 10, 1
            local scrollpane = list.scrollPane
            local scrollpaneY = scrollpane.posY
            local containerHeight = list.size.y
            for i, typeSeals in ipairs(typeSealsCollection) do
              local seals = typeSeals.seals
              for j, seal in ipairs(seals) do
                if currentSeal.itemId == seal.itemId then
                  local posY = i * titleHeight + (i - 1) * lineGap1 + (j - 1) * itemHeight + (j - 1) * lineGap2
                  local upPosY = posY + parentPosY
                  local downPosY = posY + parentPosY + itemHeight
                  if upPosY < i * titleHeight then
                    scrollpane:SetPosY(scrollpaneY + upPosY - titleHeight, true)
                    break
                  end
                  if downPosY > containerHeight - titleHeight then
                    local delta = downPosY - containerHeight + titleHeight
                    scrollpane:SetPosY(scrollpaneY + delta, true)
                  end
                  break
                end
              end
            end
          end
        end
      else
        Fold(item_list, duration)
        ChangeUIController(child:GetChild("TitleBtn"), "button", 0)
      end
    end
  else
    for k = 1, list.numChildren do
      local child = list:GetChildAt(k - 1)
      local item_list = child:GetChild("ItemList")
      local numChildren = item_list.numChildren
      local current = k == slotIndex
      if current then
        item_list.height = numChildren * elementHeight + (numChildren - 1) * gap
        ChangeUIController(child:GetChild("TitleBtn"), "button", 1)
        if currentSeal then
          local parentPosY = list.container.position.y
          local titleHeight, itemHeight, lineGap1, lineGap2 = 44, 86, 10, 1
          local scrollpane = list.scrollPane
          local scrollpaneY = scrollpane.posY
          local containerHeight = list.size.y
          for i, typeSeals in ipairs(typeSealsCollection) do
            local seals = typeSeals.seals
            for j, seal in ipairs(seals) do
              if currentSeal.itemId == seal.itemId then
                local posY = i * titleHeight + (i - 1) * lineGap1 + (j - 1) * itemHeight + (j - 1) * lineGap2
                local upPosY = posY + parentPosY
                local downPosY = posY + parentPosY + itemHeight
                if upPosY < i * titleHeight then
                  scrollpane:SetPosY(scrollpaneY + upPosY - titleHeight, true)
                  break
                end
                if downPosY > containerHeight - titleHeight then
                  local delta = downPosY - containerHeight + titleHeight
                  scrollpane:SetPosY(scrollpaneY + delta, true)
                end
                break
              end
            end
          end
        end
      else
        item_list.height = 0
        ChangeUIController(child:GetChild("TitleBtn"), "button", 0)
      end
    end
  end
  selectedSlotIndex = slotIndex
end

function RefreshPanelInfo(slotIndex, playItemAnim, playFoldAnim, refreshData)
  RefreshUnequippedSeals(slotIndex, playItemAnim, playFoldAnim, refreshData)
  RefreshAllSlotSeals()
  RefreshConsume()
  if currentSeal then
    local count = ActorData.GetItemCount(currentSeal.itemId)
    uis.Main.NumberStrip.ChoiceNumberTxt.text = string.format("%s[color=#949494]/%s[/color]", math.floor(combinedCount / 2), math.floor(count / 2))
  else
    uis.Main.NumberStrip.ChoiceNumberTxt.text = "0[color=#949494]/1[/color]"
  end
end

function AutoAdd(level, refresh)
  local typeSealsCollection = SealData.GetSeals_JobType_SplitByAttribute(jobType, nil, refresh, true)
  if typeSealsCollection and #typeSealsCollection > 0 then
    local selectedTypeSeals = typeSealsCollection[selectedSlotIndex]
    local cnt = #selectedTypeSeals.seals
    if cnt > 0 then
      if level then
        for j = cnt, 1, -1 do
          local seal = selectedTypeSeals.seals[j]
          local itemId = seal.itemId
          local conf = TableData.GetConfig(itemId, "BaseSeal")
          if ActorData.GetItemCount(seal.itemId) >= 2 and level < conf.level then
            AddSeal(seal, false, true)
            RefreshPanelInfo(selectedSlotIndex)
            return
          end
        end
        for j = 1, cnt do
          local seal = selectedTypeSeals.seals[j]
          if ActorData.GetItemCount(seal.itemId) >= 2 then
            AddSeal(seal, false, true)
            RefreshPanelInfo(selectedSlotIndex)
            return
          end
        end
        for j = cnt, 1, -1 do
          local seal = selectedTypeSeals.seals[j]
          local itemId = seal.itemId
          local conf = TableData.GetConfig(itemId, "BaseSeal")
          if ActorData.GetItemCount(itemId) >= 1 and level < conf.level then
            combinedCount = 1
            currentSeal = seal
            RefreshPanelInfo(selectedSlotIndex)
            return
          end
        end
        for j = 1, cnt do
          local seal = selectedTypeSeals.seals[j]
          local itemId = seal.itemId
          if ActorData.GetItemCount(itemId) >= 1 then
            combinedCount = 1
            currentSeal = seal
            RefreshPanelInfo(selectedSlotIndex)
            return
          end
        end
      end
      for j = cnt, 1, -1 do
        local seal = selectedTypeSeals.seals[j]
        if ActorData.GetItemCount(seal.itemId) >= 2 then
          AddSeal(seal, false, true)
          RefreshPanelInfo(selectedSlotIndex)
          return
        end
      end
    end
    currentSeal = nil
    combinedCount = 0
    RefreshAllSlotSeals()
    RefreshConsume()
    if currentSeal then
      local count = ActorData.GetItemCount(currentSeal.itemId)
      uis.Main.NumberStrip.ChoiceNumberTxt.text = string.format("%s[color=#949494]/%s[/color]", math.floor(combinedCount / 2), math.floor(count / 2))
    else
      uis.Main.NumberStrip.ChoiceNumberTxt.text = "0[color=#949494]/1[/color]"
    end
  end
end

local SelectTab = function(index)
  if wait then
    return
  end
  local configs = SealData.GetSealJobConfigs()
  local config = configs[index]
  jobType = config.job
  local tablist = uis.Main.TabList
  tablist.selectedIndex = index - 1
  if tweenerCollection then
    for i, v in ipairs(tweenerCollection) do
      LeanTween.cancel(v)
    end
    table.clear(tweenerCollection)
  end
  for i = 1, 2 do
    local panel = uis.Main.MidRegion
    local name = string.format("Slot%sBtn", i)
    local slotbtn = panel[name]
    slotbtn.onClick:Set(function()
      if HasSeal(i) then
        OpenWindow(WinResConfig.SealGetTipsWindow.name, nil, {
          id = currentSeal.itemId,
          notShowWay = false
        })
      end
    end)
  end
  RefreshPanelInfo(1, true, false, true)
  AutoAdd()
end
local GetOrCreateHolder = function(parent, name, index)
  local holder = parent:GetChild(name)
  if not holder then
    holder = CS.FairyGUI.UIObjectFactory.NewObject(CS.FairyGUI.ObjectType.Graph)
    parent:AddChildAt(holder, index)
    holder.name = name
    UIUtil.SetHolderCenter(holder)
  end
  return holder
end

function SealSynthesisWindow.ReInitData()
end

function SealSynthesisWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.SealSynthesisWindow.package, WinResConfig.SealSynthesisWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetExploreDevelop_SynthesisWindowUis(contentPane)
    jobType = bridgeObj.argTable[1]
    SealSynthesisWindow.UpdateInfo()
    SealSynthesisWindow.InitBtn()
  end)
end

function SealSynthesisWindow.UpdateInfo()
  wait = false
  local val = PlayerPrefsUtil.GetInt(PLAYER_PREF_ENUM.SEAL_DEFAULT_MAX_NUM, 0)
  max = val > 0
  if max then
    uis.Main.MaxBtn:FireClick(false, true)
  end
  uis.Main.BackGround.BackGroundLoader.url = UIUtil.GetResUrl(TableData.GetConfig(FEATURE_ENUM.SEAL_SYNTHESIS, "BaseFeature").back_ground)
  uis.Main.MidRegion.WordTxt.text = T(20574)
  uis.Main.RightRegion.TitleTxt.text = T(20576)
  uis.Main.RightRegion.Spend.Spend.WordTxt.text = T(20577)
  uis.Main.RightRegion.Spend.LackWord.WordTxt.text = T(20578)
  uis.Main.MidNothing.WordTxt.text = T(20604)
  UIUtil.SetBtnText(uis.Main.RightRegion.Spend.SureBtn, T(20579))
  UIUtil.SetBtnText(uis.Main.MaxBtn, T(20580))
  UIUtil.SetBtnText(uis.Main.NumberStrip.MinBtn, T(20581))
  UIUtil.SetBtnText(uis.Main.NumberStrip.MaxBtn, T(20582))
  local configs = SealData.GetSealJobConfigs()
  local tablist = uis.Main.TabList
  
  function tablist.itemRenderer(i, gcmp)
    local tabIndex = i + 1
    local config = configs[tabIndex]
    ChangeUIController(gcmp, "c1", config.job - 1)
    gcmp.onClick:Set(function()
      if tabIndex - 1 ~= tablist.selectedIndex then
        SelectTab(tabIndex)
        UIMgr:SendWindowMessage(WinResConfig.SealWindow.name, WindowMsgEnum.SealWindow.CHANGE_SELECTED_TAB, tabIndex)
      end
    end)
  end
  
  tablist.numItems = #configs
  local k = table.keyof(configs, jobType, "job")
  SelectTab(k)
  UIUtil.InitAssetsTips(uis.Main.AssetsTipsList, {
    COMMON_ITEM_ID.GAME_COIN
  })
  uis.Main.MidRegion.Slot1Btn:GetChild("n14").visible = false
  uis.Main.MidRegion.Slot2Btn:GetChild("n14").visible = false
  uis.Main.MidRegion.Slot3Btn:GetChild("n14").visible = false
  local parent = uis.Main.MidRegion.root
  local holder1 = GetOrCreateHolder(parent, "EffectHolder1", 0)
  local effect = ResourceManager.Instantiate("Assets/Art/Effects/Prefab/UI_prefab/TeamFormation/FX_teamformation_under.prefab")
  UIUtil.SetObjectToUI(effect, holder1)
  local holder2 = GetOrCreateHolder(parent, "EffectHolder2", 2)
  effect = ResourceManager.Instantiate("Assets/Art/Effects/Prefab/UI_prefab/TeamFormation/FX_teamformation_synthetic.prefab")
  UIUtil.SetObjectToUI(effect, holder2)
end

local tweenId
local CompositeSeal = function(dontHintToday)
  if UIMgr:IsWindowOpen(WinResConfig.SealSynthesisItemTipsWindow.name) then
    return
  end
  if dontHintToday then
    SealMgr.DropHintTimestamp()
  end
  local temp = currentSeal
  local itemId = currentSeal.itemId
  wait = true
  SealService.CompositeSealReq(itemId, combinedCount, lucky, function(msg)
    local gainItems = msg.gainItems
    local count = 0
    if gainItems then
      for _, item in ipairs(gainItems) do
        if item.itemId ~= itemId then
          count = item.count
          break
        end
      end
    end
    local holder = GetOrCreateHolder(uis.Main.MidRegion.root, "EffectHolder3", 5)
    local effect = ResourceManager.Instantiate("Assets/Art/Effects/Prefab/UI_prefab/TeamFormation/FX_teamformation_synthetic_eff.prefab")
    LuaUtil.PlayEffect(effect)
    UIUtil.SetObjectToUI(effect, holder)
    local duration = 0.7
    local go = LuaUtil.FindChild(effect, "chenggong", true)
    go:SetActive(count > 0)
    SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/ui_ky_lvup")
    tweenId = LeanTween.delayedCall(duration, function()
      wait = false
      tweenId = nil
      holder:SetNativeObject(nil)
      OpenWindow(WinResConfig.SealSynthesisItemTipsWindow.name, nil, itemId, combinedCount, count)
      ClearCurrentSeal()
      local tempLevel
      if temp then
        local seal = TableData.GetConfig(temp.itemId, "BaseSeal")
        tempLevel = seal.level
        local remainCnt = ActorData.GetItemCount(temp.itemId)
        if remainCnt >= 2 then
          AddSeal(temp)
          RefreshPanelInfo(selectedSlotIndex, false, false, true)
          return
        end
      end
      AutoAdd(tempLevel, true)
      RefreshPanelInfo(selectedSlotIndex, false, false, true)
    end).id
  end)
end

function SealSynthesisWindow.InitBtn()
  CurrencyReturnWindow.SetCurrencyReturn(WinResConfig.SealSynthesisWindow.name, uis.Main.CurrencyReturn, FEATURE_ENUM.SEAL_SYNTHESIS, function()
    if tweenId then
      return
    end
    UIMgr:CloseWindow(WinResConfig.SealSynthesisWindow.name)
  end)
  local ctrl = uis.Main.MaxBtn:GetController("button")
  ctrl.onChanged:Set(function()
    max = 1 == ctrl.selectedIndex
    PlayerPrefsUtil.SetInt(PLAYER_PREF_ENUM.SEAL_DEFAULT_MAX_NUM, max and 1 or 0)
    if max then
      AddSeal(currentSeal)
      RefreshPanelInfo(selectedSlotIndex)
    elseif currentSeal then
      while combinedCount > 2 do
        RemoveCurrentSeal()
      end
      RefreshPanelInfo(selectedSlotIndex)
    end
  end)
  uis.Main.RightRegion.c1Ctr.onChanged:Set(function()
    local useLucky = 1 == uis.Main.RightRegion.c1Ctr.selectedIndex
    lucky = useLucky
    RefreshConsume()
  end)
  uis.Main.RightRegion.Spend.SureBtn.onClick:Set(function()
    if wait then
      return
    end
    if not currentSeal or ActorData.GetItemCount(currentSeal.itemId) < 2 then
      FloatTipsUtil.ShowWarnTips(T(20605))
      return
    end
    if currentProbability < 100 and not SealMgr.IsProbabilityHinted() then
      MessageBox.Show(T(20607), {touchCallback = CompositeSeal}, {}, nil, nil, nil, {
        content = T(20608)
      })
      return
    end
    if lucky and not SealMgr.IsProbabilityIncreaseHinted() then
      MessageBox.Show(T(20609), {
        touchCallback = function(checkbox)
          if checkbox then
            SealMgr.DropProbabilityIncreaseHintTimestamp()
          end
          CompositeSeal()
        end
      }, {}, nil, nil, nil, {
        content = T(20608)
      })
      return
    end
    CompositeSeal()
  end)
  uis.Main.NumberStrip.AddBtn.onClick:Set(function()
    AddSeal(currentSeal, true)
    RefreshPanelInfo(selectedSlotIndex)
  end)
  uis.Main.NumberStrip.ReduceBtn.onClick:Set(function()
    RemoveCurrentSeal()
    RefreshPanelInfo(selectedSlotIndex)
  end)
  uis.Main.NumberStrip.MaxBtn.onClick:Set(function()
    local preMax = max
    max = true
    AddSeal(currentSeal)
    max = preMax
    RefreshPanelInfo(selectedSlotIndex)
  end)
  uis.Main.NumberStrip.MinBtn.onClick:Set(function()
    if currentSeal then
      while combinedCount > 2 do
        RemoveCurrentSeal()
      end
      RefreshPanelInfo(selectedSlotIndex)
    end
  end)
  uis.Main.MidRegion.Slot3Btn.onClick:Set(function()
    if currentSeal then
      local sealConf = TableData.GetConfig(currentSeal.itemId, "BaseSeal")
      if sealConf then
        OpenWindow(WinResConfig.SealGetTipsWindow.name, nil, {
          id = sealConf.next_seal_id,
          notShowWay = false
        })
      end
    end
  end)
end

function SealSynthesisWindow.OnClose()
  uis = nil
  contentPane = nil
  max = nil
  currentSeal = nil
  combinedCount = 0
  if valTweener then
    LeanTween.cancel(valTweener)
  end
  valTweener = nil
  if tweenId then
    LeanTween.cancel(tweenId)
  end
  tweenId = nil
  wait = false
  lucky = false
end

function SealSynthesisWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.Common.E_MSG_ITEM_CHANGE then
    uis.Main.AssetsTipsList.numItems = 1
  end
end

return SealSynthesisWindow
