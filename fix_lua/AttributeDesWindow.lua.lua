require("CardAttribute_AttributeDesWindowByName")
local AttributeDesWindow = {}
local uis, contentPane, displayDetailMode

function AttributeDesWindow.ReInitData()
end

function AttributeDesWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.AttributeDesWindow.package, WinResConfig.AttributeDesWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetCardAttribute_AttributeDesWindowUis(contentPane)
    AttributeDesWindow.InitBtn()
    AttributeDesWindow.InitUI()
    SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.GET_ITEM_IN)
  end)
end

function AttributeDesWindow.GetData()
  local config = TableData.GetTable("BaseAttribute")
  local t = {}
  if config then
    for i, v in pairs(config) do
      if v.sort then
        table.insert(t, v)
      end
    end
  end
  table.sort(t, function(a, b)
    return a.sort < b.sort
  end)
  return t
end

function AttributeDesWindow.ShowAttribute(show_type, item, attribute)
  if 1 == show_type then
    UIUtil.SetText(item, attribute, "NumberTxt")
  elseif 2 == show_type then
    UIUtil.SetText(item, T(91, FormatValidateNum(attribute / 100)), "NumberTxt")
  elseif 3 == show_type then
    UIUtil.SetText(item, GetPreciseDecimal(FormatValidateNum(attribute / 1000), 2), "NumberTxt")
  end
end

local GetValue = function(value_enhance, baseValue)
  if value_enhance < 0 then
    return math.ceil(baseValue * 10000 / (10000 - value_enhance))
  elseif value_enhance > 0 then
    return math.ceil(baseValue * (10000 + value_enhance) / 10000)
  end
end
local GetAttribute = function(show_type, attribute)
  if 1 == show_type then
    return attribute
  elseif 2 == show_type then
    return T(91, FormatValidateNum(attribute / 100))
  elseif 3 == show_type then
    return GetPreciseDecimal(FormatValidateNum(attribute / 1000), 2)
  end
end
local RefreshMemberAttributes = function()
  local list = uis.Main.CardScreen1.Tips.CardAttributeList
  local data = AttributeDesWindow.GetData()
  local moveId = CardAttribute.GetIdByName("spd_move")
  local atkId = CardAttribute.GetIdByName("spd_atk")
  local moveIdPer = CardAttribute.GetIdByName("spd_move_enhance")
  local atkIdPer = CardAttribute.GetIdByName("spd_atk_enhance")
  
  function list.itemRenderer(i, gcmp)
    local index = i + 1
    local id = data[index].id
    local item = gcmp:GetChild("CardAttribute")
    item.alpha = 0
    PlayUITrans(gcmp, "up", nil, i * 0.03)
    ChangeUIController(item, "c1", data[index].sort)
    ChangeUIController(item, "c2", index % 2)
    ChangeUIController(item, "c3", data[index].des and 1 or 0)
    ChangeUIController(item, "c4", 0)
    UIUtil.SetText(item, data[index].display_name())
    local cardAttribute = CardMgr.cardInfoData.attributes[id] or 0
    local attrValue = cardAttribute
    if id == moveId then
      local cardEnhance = CardMgr.cardInfoData.attributes[moveIdPer] or 0
      UIUtil.SetText(item, "", "AddNumberTxt")
      local tatal = cardEnhance
      if 0 ~= tatal then
        attrValue = GetValue(tatal, attrValue)
      end
    elseif id == atkId then
      local cardEnhance = CardMgr.cardInfoData.attributes[atkIdPer] or 0
      UIUtil.SetText(item, "", "AddNumberTxt")
      local tatal = cardEnhance
      if 0 ~= tatal then
        attrValue = GetValue(tatal, attrValue)
      end
    end
    AttributeDesWindow.ShowAttribute(data[index].show_type, item, attrValue)
    item:GetChild("CardAttributeTipsBtn").onClick:Set(function()
      if data[index].des then
        OpenWindow(WinResConfig.CardAttributeTipsWindow.name, nil, {
          des = data[index].des(),
          titleTxt = data[index].display_name()
        })
      end
    end)
  end
  
  list.numItems = #data
end
local RefreshBadgeAttributes = function()
  local list = uis.Main.CardScreen1.Tips.CardAttributeList
  local badgeAttribute = CardData.GetBadgeAddAttribute()
  local data = AttributeDesWindow.GetData()
  local moveId = CardAttribute.GetIdByName("spd_move")
  local atkId = CardAttribute.GetIdByName("spd_atk")
  local moveIdPer = CardAttribute.GetIdByName("spd_move_enhance")
  local atkIdPer = CardAttribute.GetIdByName("spd_atk_enhance")
  
  function list.itemRenderer(i, gcmp)
    local index = i + 1
    local id = data[index].id
    local item = gcmp:GetChild("CardAttribute")
    item.alpha = 0
    PlayUITrans(gcmp, "up", nil, i * 0.03)
    ChangeUIController(item, "c1", data[index].sort)
    ChangeUIController(item, "c2", index % 2)
    ChangeUIController(item, "c3", data[index].des and 1 or 0)
    ChangeUIController(item, "c4", 0)
    UIUtil.SetText(item, data[index].display_name())
    local attrValue = badgeAttribute[id] or 0
    if id == moveId then
      local badgeEnhance = badgeAttribute[moveIdPer] or 0
      UIUtil.SetText(item, "", "AddNumberTxt")
      local tatal = badgeEnhance
      if 0 ~= tatal then
        attrValue = GetValue(tatal, attrValue)
      end
    elseif id == atkId then
      local badgeEnhance = badgeAttribute[atkIdPer] or 0
      UIUtil.SetText(item, "", "AddNumberTxt")
      local tatal = badgeEnhance
      if 0 ~= tatal then
        attrValue = GetValue(tatal, attrValue)
      end
    end
    AttributeDesWindow.ShowAttribute(data[index].show_type, item, attrValue)
    item:GetChild("CardAttributeTipsBtn").onClick:Set(function()
      if data[index].des then
        OpenWindow(WinResConfig.CardAttributeTipsWindow.name, nil, {
          des = data[index].des(),
          titleTxt = data[index].display_name()
        })
      end
    end)
  end
  
  list.numItems = #data
end
local RefreshSealAttributes = function()
  local list = uis.Main.CardScreen1.Tips.CardAttributeList
  local sealAllAttribute = CardData.GetSealAddAttribute()
  local data = AttributeDesWindow.GetData()
  local moveId = CardAttribute.GetIdByName("spd_move")
  local atkId = CardAttribute.GetIdByName("spd_atk")
  local moveIdPer = CardAttribute.GetIdByName("spd_move_enhance")
  local atkIdPer = CardAttribute.GetIdByName("spd_atk_enhance")
  
  function list.itemRenderer(i, gcmp)
    local index = i + 1
    local id = data[index].id
    local item = gcmp:GetChild("CardAttribute")
    item.alpha = 0
    PlayUITrans(gcmp, "up", nil, i * 0.03)
    ChangeUIController(item, "c1", data[index].sort)
    ChangeUIController(item, "c2", index % 2)
    ChangeUIController(item, "c3", data[index].des and 1 or 0)
    ChangeUIController(item, "c4", 0)
    UIUtil.SetText(item, data[index].display_name())
    local attrValue = sealAllAttribute[id] or 0
    if id == moveId then
      local sealEnhance = sealAllAttribute[moveIdPer] or 0
      UIUtil.SetText(item, "", "AddNumberTxt")
      local tatal = sealEnhance
      if 0 ~= tatal then
        attrValue = GetValue(tatal, attrValue)
      end
    elseif id == atkId then
      local sealEnhance = sealAllAttribute[atkIdPer] or 0
      UIUtil.SetText(item, "", "AddNumberTxt")
      local tatal = sealEnhance
      if 0 ~= tatal then
        attrValue = GetValue(tatal, attrValue)
      end
    end
    AttributeDesWindow.ShowAttribute(data[index].show_type, item, attrValue)
    item:GetChild("CardAttributeTipsBtn").onClick:Set(function()
      if data[index].des then
        OpenWindow(WinResConfig.CardAttributeTipsWindow.name, nil, {
          des = data[index].des(),
          titleTxt = data[index].display_name()
        })
      end
    end)
  end
  
  list.numItems = #data
end
local RefreshIllustrationAttributes = function()
  local list = uis.Main.CardScreen1.Tips.CardAttributeList
  local illustratedAllAttribute = CardData.GetAllHandBookAttrList(ActorData.GetActorInfo().activeHandBookGrowId)
  local data = AttributeDesWindow.GetData()
  local moveId = CardAttribute.GetIdByName("spd_move")
  local atkId = CardAttribute.GetIdByName("spd_atk")
  local moveIdPer = CardAttribute.GetIdByName("spd_move_enhance")
  local atkIdPer = CardAttribute.GetIdByName("spd_atk_enhance")
  
  function list.itemRenderer(i, gcmp)
    local index = i + 1
    local id = data[index].id
    local item = gcmp:GetChild("CardAttribute")
    item.alpha = 0
    PlayUITrans(gcmp, "up", nil, i * 0.03)
    ChangeUIController(item, "c1", data[index].sort)
    ChangeUIController(item, "c2", index % 2)
    ChangeUIController(item, "c3", data[index].des and 1 or 0)
    ChangeUIController(item, "c4", 0)
    UIUtil.SetText(item, data[index].display_name())
    local attrValue = illustratedAllAttribute[id] or 0
    if id == moveId then
      local illustrationEnhance = illustratedAllAttribute[moveIdPer] or 0
      UIUtil.SetText(item, "", "AddNumberTxt")
      local tatal = illustrationEnhance
      if 0 ~= tatal then
        attrValue = GetValue(tatal, attrValue)
      end
    elseif id == atkId then
      local illustrationEnhance = illustratedAllAttribute[atkIdPer] or 0
      UIUtil.SetText(item, "", "AddNumberTxt")
      local tatal = illustrationEnhance
      if 0 ~= tatal then
        attrValue = GetValue(tatal, attrValue)
      end
    end
    AttributeDesWindow.ShowAttribute(data[index].show_type, item, attrValue)
    item:GetChild("CardAttributeTipsBtn").onClick:Set(function()
      if data[index].des then
        OpenWindow(WinResConfig.CardAttributeTipsWindow.name, nil, {
          des = data[index].des(),
          titleTxt = data[index].display_name()
        })
      end
    end)
  end
  
  list.numItems = #data
end
local RefreshSummaryPanel = function(dont_play_anim)
  local panel = uis.Main.CardScreen1.Tips
  panel.c1Ctr.selectedIndex = 0
  local list = panel.CardAttributeList
  local data = AttributeDesWindow.GetData()
  local badgeAttribute = CardData.GetBadgeAddAttribute()
  local sealAllAttribute = CardData.GetSealAddAttribute()
  local illustratedAllAttribute = CardData.GetAllHandBookAttrList(ActorData.GetActorInfo().activeHandBookGrowId)
  local moveId = CardAttribute.GetIdByName("spd_move")
  local atkId = CardAttribute.GetIdByName("spd_atk")
  local moveIdPer = CardAttribute.GetIdByName("spd_move_enhance")
  local atkIdPer = CardAttribute.GetIdByName("spd_atk_enhance")
  
  function list.itemRenderer(i, gcmp)
    local index = i + 1
    local id = data[index].id
    local item = gcmp:GetChild("CardAttribute")
    if not dont_play_anim then
      item.alpha = 0
      PlayUITrans(gcmp, "up", nil, i * 0.03)
    end
    ChangeUIController(item, "c1", data[index].sort)
    ChangeUIController(item, "c2", index % 2)
    ChangeUIController(item, "c3", data[index].des and 1 or 0)
    UIUtil.SetText(item, data[index].display_name())
    local cardAttribute = CardMgr.cardInfoData.attributes[id] or 0
    local attributeBadge = badgeAttribute[id] or 0
    local sealAttribute = sealAllAttribute[id] or 0
    local illustratedAttribute = illustratedAllAttribute[id] or 0
    local attrValue = cardAttribute + attributeBadge + sealAttribute + illustratedAttribute
    local without = 0 == attributeBadge and 0 == sealAttribute and 0 == illustratedAttribute
    ChangeUIController(item, "c4", not (not displayDetailMode or without) and 1 or 0)
    if id == moveId then
      local badgeEnhance = badgeAttribute[moveIdPer] or 0
      local cardEnhance = CardMgr.cardInfoData.attributes[moveIdPer] or 0
      local sealEnhance = sealAllAttribute[moveIdPer] or 0
      local illustratedEnhance = illustratedAllAttribute[moveIdPer] or 0
      UIUtil.SetText(item, "", "AddNumberTxt")
      local tatal = cardEnhance + badgeEnhance + sealEnhance + illustratedEnhance
      if 0 ~= tatal then
        attrValue = GetValue(tatal, attrValue)
      end
    elseif id == atkId then
      local badgeEnhance = badgeAttribute[atkIdPer] or 0
      local cardEnhance = CardMgr.cardInfoData.attributes[atkIdPer] or 0
      local sealEnhance = sealAllAttribute[atkIdPer] or 0
      local illustratedEnhance = illustratedAllAttribute[moveIdPer] or 0
      UIUtil.SetText(item, "", "AddNumberTxt")
      local tatal = cardEnhance + badgeEnhance + sealEnhance + illustratedEnhance
      if 0 ~= tatal then
        attrValue = GetValue(tatal, attrValue)
      end
    elseif 0 ~= attributeBadge or 0 ~= sealAttribute or 0 ~= illustratedAttribute then
      local illustrationNum = 0 ~= illustratedAttribute and T(20859, GetAttribute(data[index].show_type, illustratedAttribute)) or ""
      local badgeNum = 0 ~= attributeBadge and T(1660, GetAttribute(data[index].show_type, attributeBadge)) or ""
      local sealNum = 0 ~= sealAttribute and T(1661, GetAttribute(data[index].show_type, sealAttribute)) or ""
      UIUtil.SetText(item, string.format("%s%s%s%s", T(1659, GetAttribute(data[index].show_type, cardAttribute)), illustrationNum, badgeNum, sealNum), "AddNumberTxt")
    else
      UIUtil.SetText(item, "", "AddNumberTxt")
    end
    AttributeDesWindow.ShowAttribute(data[index].show_type, item, attrValue)
    item:GetChild("CardAttributeTipsBtn").onClick:Set(function()
      if data[index].des then
        OpenWindow(WinResConfig.CardAttributeTipsWindow.name, nil, {
          des = data[index].des(),
          titleTxt = data[index].display_name()
        })
      end
    end)
  end
  
  list.numItems = #data
end
local DETAIL_LIST = {
  [1] = {
    name = T(20854),
    onClick = RefreshMemberAttributes
  },
  [2] = {
    name = T(20857),
    featureId = FEATURE_ENUM.HOME_STORY,
    onClick = RefreshIllustrationAttributes
  },
  [3] = {
    name = T(20855),
    featureId = FEATURE_ENUM.HOME_BADGE,
    onClick = RefreshBadgeAttributes
  },
  [4] = {
    name = T(20856),
    featureId = FEATURE_ENUM.SEAL,
    onClick = RefreshSealAttributes
  }
}
local RefreshDetailPanel = function()
  local panel = uis.Main.CardScreen1.Tips
  local detailItemlist = panel.Type2List
  panel.c1Ctr.selectedIndex = 1
  local list = {}
  for i, v in ipairs(DETAIL_LIST) do
    if not v.featureId or EnterClampUtil.WhetherToEnter(v.featureId, false) then
      table.insert(list, v)
    end
  end
  
  function detailItemlist.itemRenderer(i, gcmp)
    local item = list[i + 1]
    UIUtil.SetText(gcmp, item.name, "WordTxt")
    gcmp.onClick:Set(function()
      item.onClick()
      detailItemlist.selectedIndex = i
    end)
  end
  
  detailItemlist.numItems = #list
  local defaultSelectedIndex = 0
  DETAIL_LIST[defaultSelectedIndex + 1].onClick()
  detailItemlist.selectedIndex = defaultSelectedIndex
end
local TAB_LIST = {
  [1] = {
    name = T(20852),
    onClick = RefreshSummaryPanel
  },
  [2] = {
    name = T(20853),
    onClick = RefreshDetailPanel
  }
}

function AttributeDesWindow.InitUI()
  displayDetailMode = false
  local panel = uis.Main.CardScreen1.Tips
  local tablist = panel.Type1List
  
  function tablist.itemRenderer(i, gcmp)
    local item = TAB_LIST[i + 1]
    UIUtil.SetText(gcmp, item.name, "WordTxt")
    gcmp.onClick:Set(function()
      if tablist.selectedIndex == i then
        return
      end
      item.onClick()
      tablist.selectedIndex = i
      uis.Main.CardScreen1.Tips.ChoiceBtn.visible = 0 == i
    end)
  end
  
  tablist.numItems = #TAB_LIST
  local defaultSelectedIndex = 0
  tablist.selectedIndex = defaultSelectedIndex
  TAB_LIST[defaultSelectedIndex + 1].onClick()
  uis.Main.CardScreen1.Tips.ChoiceBtn.visible = true
  UIUtil.SetText(uis.Main.CardScreen1.Tips.ChoiceBtn, T(20851))
end

function AttributeDesWindow.Quit()
  UIMgr:CloseWindow(WinResConfig.AttributeDesWindow.name)
end

function AttributeDesWindow.InitBtn()
  uis.Main.CardScreen1.Tips.ChoiceBtn.onClick:Set(function()
    displayDetailMode = not displayDetailMode
    RefreshSummaryPanel(true)
  end)
  uis.Main.CloseBtn.onClick:Set(AttributeDesWindow.Quit)
  uis.Main.TouchScreenBtn.onClick:Set(AttributeDesWindow.Quit)
end

function AttributeDesWindow.OnClose()
  uis = nil
  contentPane = nil
end

function AttributeDesWindow.HandleMessage(msgId, para)
end

return AttributeDesWindow
