require("CardAttribute_BadgeCardInfoWindowByName")
local BadgeCardInfoWindow = {}
local uis, contentPane, cardInfo, skillInfo, displayDetailMode

function BadgeCardInfoWindow.ReInitData()
end

function BadgeCardInfoWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.BadgeCardInfoWindow.package, WinResConfig.BadgeCardInfoWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetCardAttribute_BadgeCardInfoWindowUis(contentPane)
    cardInfo = bridgeObj.argTable[1]
    CardMgr.InitData(cardInfo.cardId)
    BadgeCardInfoWindow.UpdateInfo()
    BadgeCardInfoWindow.InitBtn()
    BadgeCardInfoWindow.InitUI()
  end)
end

function BadgeCardInfoWindow.GetData()
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

function BadgeCardInfoWindow.ShowAttribute(show_type, item, attribute)
  if 1 == show_type then
    UIUtil.SetText(item, attribute, "NumberTxt")
  elseif 2 == show_type then
    UIUtil.SetText(item, T(91, FormatValidateNum(attribute / 100)), "NumberTxt")
  elseif 3 == show_type then
    UIUtil.SetText(item, GetPreciseDecimal(FormatValidateNum(attribute / 1000), 2), "NumberTxt")
  end
end

function BadgeCardInfoWindow.ShowAddAttribute(show_type, item, attribute)
  if 1 == show_type then
    UIUtil.SetText(item, T(380, attribute), "AddNumberTxt")
  elseif 2 == show_type then
    UIUtil.SetText(item, T(380, T(91, FormatValidateNum(attribute / 100))), "AddNumberTxt")
  elseif 3 == show_type then
    UIUtil.SetText(item, T(380, GetPreciseDecimal(FormatValidateNum(attribute / 1000), 2)), "AddNumberTxt")
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
  local data = BadgeCardInfoWindow.GetData()
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
    BadgeCardInfoWindow.ShowAttribute(data[index].show_type, item, attrValue)
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
  local data = BadgeCardInfoWindow.GetData()
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
    BadgeCardInfoWindow.ShowAttribute(data[index].show_type, item, attrValue)
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
  local data = BadgeCardInfoWindow.GetData()
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
    BadgeCardInfoWindow.ShowAttribute(data[index].show_type, item, attrValue)
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
  local data = BadgeCardInfoWindow.GetData()
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
    BadgeCardInfoWindow.ShowAttribute(data[index].show_type, item, attrValue)
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
  local data = BadgeCardInfoWindow.GetData()
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
      local illustratedEnhance = illustratedAllAttribute[atkIdPer] or 0
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
    BadgeCardInfoWindow.ShowAttribute(data[index].show_type, item, attrValue)
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

function BadgeCardInfoWindow.InitUI()
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

function BadgeCardInfoWindow.GetSkillInfo()
  skillInfo = {}
  local configData = TableData.GetConfig(cardInfo.cardId, "BaseCard")
  if configData then
    local skillData = {
      configData.leader_skill,
      configData.special_skill,
      configData.burst_skill
    }
    local GetSkillLv = function(skillId)
      local lv = cardInfo.skill2Level[skillId] or 1
      local addLv = cardInfo.gradeUpSkills[skillId] or 0
      return lv + addLv
    end
    for i = 1, #skillData do
      local data = TableData.GetConfig(skillData[i], "BaseSkill")
      table.insert(skillInfo, {
        id = data.id,
        type = data.type,
        level = GetSkillLv(data.id),
        cardInfo = cardInfo
      })
    end
  end
end

function BadgeCardInfoWindow.UpdateInfo()
  BadgeCardInfoWindow.GetSkillInfo()
  
  function uis.Main.SpclSkillTipsList.itemRenderer(i, tips)
    local skillData = TableData.GetConfig(skillInfo[i + 1].id, "BaseSkill")
    local skill2Level = {}
    if skillInfo[i + 1].cardInfo.skillLevels then
      skill2Level = {}
      local skillLevels = skillInfo[i + 1].cardInfo.skillLevels
      for i, v in ipairs(skillLevels) do
        skill2Level[v.skillId] = v.level
      end
    elseif skillInfo[i + 1].cardInfo.skill2Level then
      skill2Level = skillInfo[i + 1].cardInfo.skill2Level
    end
    if skillData then
      local list = tips:GetChild("TipsList")
      
      function list.itemRenderer(ii, skill)
        UIUtil.SetText(skill, skillData.name(), "NameTxt")
        local detailsSkillIcon = skill:GetChild("DetailsSkillIcon")
        if detailsSkillIcon then
          CardMgr.ShowSkillTypeInfo(skillData, detailsSkillIcon, nil, cardInfo.cardId)
          detailsSkillIcon:GetChild("Skill"):GetChild("IconLoader").url = UIUtil.GetResUrl(skillData.icon)
        end
        local id = skillData.id * 1000 + skillInfo[i + 1].level
        local skillLvData = TableData.GetConfig(id, "BaseSkillLevelUp")
        local desText = skill:GetChild("WordTxt")
        if skillLvData and skillLvData.des and desText then
          desText.text = skillLvData.des()
        end
        if skillData.type == SKILL_TYPE_ENUM.LEADER then
          UIUtil.SetText(skill, "", "LevelTxt")
          local leaderSkillInfo = skill:GetChild("LeaderSkillInfo")
          ChangeUIController(leaderSkillInfo, "c1", skill2Level[skillData.id] and 1 or 0)
          UIUtil.SetText(leaderSkillInfo, T(1310), "TitleTxt")
          UIUtil.SetText(leaderSkillInfo, T(1312), "WordTxt")
          ChangeUIController(skill, "c1", 2)
        else
          local lv = T(244, skillInfo[i + 1].level)
          UIUtil.SetText(skill, lv, "LevelTxt")
          if skillData.association_skills then
            local detailsSkillInfo = skill:GetChild("DetailsSkillInfo")
            BadgeCardInfoWindow.ShowSkillDes(detailsSkillInfo, skillData.association_skills, skillInfo[i + 1])
            local SizeImage = skill:GetChild("SizeImage")
            SizeImage:SetSize(SizeImage.width, 152 + detailsSkillInfo.height + desText.height)
            ChangeUIController(skill, "c1", 1)
          else
            ChangeUIController(skill, "c1", 0)
            local SizeImage = skill:GetChild("SizeImage")
            SizeImage:SetSize(SizeImage.width, 152 + desText.height)
          end
        end
      end
      
      list.numItems = 1
    end
    UIUtil.SetText(tips:GetChild("SkillLeaderLcok"), T(1311), "WordTxt")
    ChangeUIController(tips, "c1", skill2Level[skillData.id] and 0 or 1)
    PlayUITrans(tips, skill2Level[skillData.id] and "in" or "inlock", nil, i * 0.1)
  end
  
  uis.Main.SpclSkillTipsList.numItems = #skillInfo
end

function BadgeCardInfoWindow.ShowSkillDes(info, skills, skInfo)
  UIUtil.SetText(info, T(1135), "TitleTxt")
  local list = info:GetChild("SkillList")
  local name = {
    T(1136),
    T(1137),
    T(1138)
  }
  
  function list.itemRenderer(i, item)
    local arr = Split(skills[i + 1], ":")
    local type = tonumber(arr[1])
    if type and name[type + 1] then
      UIUtil.SetText(item, name[type + 1], "NameTxt")
      ChangeUIController(item, "c1", type)
    end
    if 0 == type then
      local lockLv = string.sub(arr[2], -3)
      if lockLv then
        lockLv = tonumber(lockLv)
        ChangeUIController(item, "c2", lockLv <= skInfo.level and 1 or 0)
      end
    elseif 1 == type then
      local star = tonumber(arr[3])
      if skInfo.cardInfo and star and star <= skInfo.cardInfo.grade then
        ChangeUIController(item, "c2", 1)
      else
        ChangeUIController(item, "c2", 0)
      end
    elseif 2 == type then
      local badgeId = tonumber(arr[3])
      local badgeStar = tonumber(arr[4])
      local badgeInfo = ActorData.GetBadgeInfoById(badgeId)
      if badgeInfo and badgeStar and badgeStar <= badgeInfo.grade then
        ChangeUIController(item, "c2", 1)
      else
        ChangeUIController(item, "c2", 0)
      end
    end
    local skillLvData = TableData.GetConfig(tonumber(arr[2]), "BaseSkillLevelUp")
    if skillLvData and skillLvData.association_des then
      UIUtil.SetText(item, skillLvData.association_des(), "WordTxt")
    end
  end
  
  list.numItems = #skills
  list:ResizeToFit()
end

function BadgeCardInfoWindow.InitBtn()
  uis.Main.c1Ctr.selectedIndex = 0
  UIUtil.SetText(uis.Main.SwitchBtn, T(1351))
  uis.Main.SwitchBtn.onClick:Set(function()
    uis.Main.c1Ctr.selectedIndex = 0 == uis.Main.c1Ctr.selectedIndex and 1 or 0
    UIUtil.SetText(uis.Main.SwitchBtn, 1 == uis.Main.c1Ctr.selectedIndex and T(1352) or T(1351))
  end)
  uis.Main.CloseBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.BadgeCardInfoWindow.name)
  end)
  uis.Main.TouchScreenBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.BadgeCardInfoWindow.name)
  end)
  uis.Main.CardScreen1.Tips.ChoiceBtn.onClick:Set(function()
    displayDetailMode = not displayDetailMode
    RefreshSummaryPanel(true)
  end)
end

function BadgeCardInfoWindow.OnClose()
  uis = nil
  contentPane = nil
  cardInfo = nil
  skillInfo = nil
end

return BadgeCardInfoWindow
