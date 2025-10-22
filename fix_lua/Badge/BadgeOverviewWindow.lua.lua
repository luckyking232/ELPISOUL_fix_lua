require("BadgeOverview_BadgeOverviewWindowByName")
local BadgeOverviewWindow = {}
local uis, contentPane, cardId, choiceData, cardListData, maskTexture, homePartData, animTime

function BadgeOverviewWindow.ReInitData()
end

function BadgeOverviewWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.BadgeOverviewWindow.package, WinResConfig.BadgeOverviewWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetBadgeOverview_BadgeOverviewWindowUis(contentPane)
    uis.Main.BackGround.BackGroundLoader.url = UIUtil.GetBackgroundUrl(FEATURE_ENUM.HOME_BADGE)
    maskTexture = ResourceManager.LoadTexture("Assets/Art/TextureSingle/UI/badge_head_mask.png")
    BadgeOverviewWindow.UpdateInfo()
    BadgeOverviewWindow.InitBtn()
  end)
end

function BadgeOverviewWindow.UpdateCardList(refresh)
  cardListData = cardListData or {}
  local cardList = uis.Main.CardList
  if not refresh then
    cardId = nil
    cardList.selectedIndex = -1
  end
  BadgeOverviewWindow.StopAnim()
  
  function cardList.itemRenderer(i, item)
    local cardConfig = TableData.GetConfig(cardListData[i + 1].cardId, "BaseCard")
    local headFrame = item:GetChild("HeadFrame")
    local levelTxt = headFrame:GetChild("LevelTxt")
    local lvId = cardConfig.grow_model_id * 1000 + cardListData[i + 1].level
    local lvData = TableData.GetConfig(lvId, "BaseCardLevelUp")
    levelTxt.text = T(10041, lvData.level_show)
    local fashionConfig = TableData.GetConfig(cardListData[i + 1].fashionId, "BaseFashion")
    local loader = headFrame:GetChild("HeadFrameBg"):GetChild("PicLoader")
    loader.url = UIUtil.GetResUrl(fashionConfig.head_icon_rect)
    if nil ~= maskTexture then
      loader:SetMaskTexture(maskTexture)
    end
    ChangeUIController(headFrame, "c1", cardConfig.star - 1)
    local occupation = headFrame:GetChild("Occupation")
    ChangeUIController(occupation, "c1", cardConfig.type - 1)
    ChangeUIController(headFrame:GetChild("CardBreach"), "c1", cardListData[i + 1].quality)
    BadgeOverviewWindow.ShowCardWarnMask(headFrame, cardListData[i + 1].cardId)
    item.onClick:Set(function()
      if cardList.selectedIndex ~= i then
        cardId = cardListData[i + 1].cardId
        cardList.selectedIndex = i
        BadgeOverviewWindow.ShowBadgeInfo(cardListData[i + 1].cardId)
        BadgeOverviewWindow.InitHomePartData(cardId)
        BadgeOverviewWindow.UpdateAutoWearState()
      end
    end)
    if i < 16 and not refresh then
      headFrame.alpha = 0
      animTime[item] = PlayUITrans(item, "up", function()
        animTime[item] = nil
      end, i * 0.03)
    else
      headFrame.alpha = 1
    end
    if 0 == i and not refresh then
      item.onClick:Call()
    end
  end
  
  cardList.numItems = #cardListData
  if 0 == #cardListData then
    BadgeOverviewWindow.ShowBadgeInfo(0)
    ChangeController(uis.Main.c2Ctr, 1)
  else
    ChangeController(uis.Main.c2Ctr, 0)
  end
end

function BadgeOverviewWindow.StopAnim()
  if animTime then
    for i, v in pairs(animTime) do
      v:Stop(true, true)
    end
  end
  animTime = {}
end

function BadgeOverviewWindow.UpdateInfo()
  local top = {
    [1] = {
      name = T(1719),
      type = 0
    },
    [2] = {
      name = T(1720),
      type = 1
    }
  }
  local topList = uis.Main.TopTabRegion.TabList
  
  function topList.itemRenderer(i, item)
    UIUtil.SetText(item, top[i + 1].name)
    item.onClick:Set(function()
      if topList.selectedIndex ~= i then
        if 0 == top[i + 1].type then
          BadgeOverviewWindow.ShowCard()
        elseif 1 == top[i + 1].type then
          local team = ActorData.GetAllTeam()
          if team and 0 == table.getLen(team) then
            FloatTipsUtil.ShowWarnTips(T(1729))
            return
          end
          BadgeOverviewWindow.ShowTeam()
        end
        topList.selectedIndex = i
      end
    end)
    if 0 == i then
      item.onClick:Call()
    end
  end
  
  topList.numItems = #top
end

function BadgeOverviewWindow.ShowCard()
  local tab = {
    [1] = {
      text = T(616),
      index = 1
    },
    [2] = {
      text = T(617),
      index = 2
    },
    [3] = {
      text = T(619),
      index = 4
    },
    [4] = {
      text = T(620),
      index = 5
    }
  }
  choiceData = {}
  uis.Main.LeftTabRegion.c1Ctr.selectedIndex = 0
  local list = uis.Main.LeftTabRegion.OccupationList
  
  function list.itemRenderer(i, item)
    UIUtil.SetText(item, tab[i + 1].text)
    ChangeUIController(item, "c1", tab[i + 1].index - 1)
    item.selected = false
    item.onClick:Set(function()
      item.selected = not item.selected
      choiceData[tab[i + 1].index] = item.selected
      if table.getLen(choiceData) > 0 then
        cardListData = BadgeOverviewWindow.GetChoiceListData()
      else
        cardListData = CardData.GetSortCardList()
      end
      BadgeOverviewWindow.UpdateCardList()
    end)
  end
  
  list.numItems = #tab
  cardListData = CardData.GetSortCardList()
  BadgeOverviewWindow.UpdateCardList()
end

function BadgeOverviewWindow.ShowTeam()
  uis.Main.LeftTabRegion.c1Ctr.selectedIndex = 1
  local list = uis.Main.LeftTabRegion.TeamList
  list.selectedIndex = -1
  local teamList = ActorData.GetAllTeam()
  
  function list.itemRenderer(i, item)
    UIUtil.SetText(item, teamList[i + 1].name)
    item.onClick:Set(function()
      if list.selectedIndex ~= i then
        local cardIds = teamList[i + 1].cardIds
        cardListData = {}
        for ind = 1, #cardIds do
          table.insert(cardListData, CardData.GetCardDataById(cardIds[ind]))
        end
        BadgeOverviewWindow.UpdateCardList()
        list.selectedIndex = i
      end
    end)
    if 0 == i then
      item.onClick:Call()
    end
  end
  
  list.numItems = #teamList
end

function BadgeOverviewWindow.GetChoiceListData(cardList)
  cardList = cardList or ActorData.GetCardList()
  local configData
  local tb = {}
  local occupationBol = table.getLen(choiceData) > 0
  for _, v in ipairs(cardList) do
    configData = CardData.GetBaseConfig(v.cardId)
    if configData and configData.type and choiceData[configData.type] then
      table.insert(tb, v)
    end
  end
  return CardData.GetSortCardList(tb)
end

function BadgeOverviewWindow.ShowBadgeInfo(wearCardId)
  local cardInfo = CardData.GetCardDataById(wearCardId)
  local badgeInfo = {}
  local effect = {}
  if cardInfo then
    local CanAdd = function(suitId)
      for i, v in ipairs(effect) do
        if v.suitId == suitId then
          return false
        end
      end
      return true
    end
    local teamBadge
    for i, v in ipairs(cardInfo.wearBadgeUids) do
      local info = ActorData.GetBadgeInfoByUid(v)
      if info then
        teamBadge = TableData.GetConfig(info.badgeId, "BaseBadge")
        if teamBadge then
          badgeInfo[teamBadge.type] = info
          if CanAdd(teamBadge.suit_group_id) then
            table.insert(effect, {
              type = teamBadge.type,
              info = info,
              suitId = teamBadge.suit_group_id
            })
          end
        end
      end
    end
  end
  table.sort(effect, function(a, b)
    return a.type < b.type
  end)
  local attributeList = uis.Main.AttributeRegion.BadgeList
  
  function attributeList.itemRenderer(i, item)
    local info = badgeInfo[i + 1]
    if info then
      ChangeUIController(item, "c2", 0)
      local badgeData = TableData.GetConfig(info.badgeId, "BaseBadge")
      if badgeData then
        UIUtil.SetText(item, badgeData.name(), "NameTxt")
        UIUtil.SetText(item, BadgeData.GetBadgePartName(badgeData.type), "TypeTxt")
        BadgeMgr.ShowLevel(item:GetChild("LevelTxt"), info.level)
        item:GetChild("PicLoader").url = UIUtil.GetResUrl(badgeData.icon)
        ChangeUIController(item, "c1", badgeData.star - 1)
        BadgeOverviewWindow.ShowBadgeAttribute(item:GetChild("Attribute1"), info)
      end
    else
      ChangeUIController(item, "c3", i)
      ChangeUIController(item, "c2", 1)
    end
  end
  
  attributeList.numItems = 3
  local effectList = uis.Main.EffectRegion.BadgeList
  
  function effectList.itemRenderer(i, item)
    local badgeData = TableData.GetConfig(effect[i + 1].info.badgeId, "BaseBadge")
    if badgeData then
      BadgeOverviewWindow.ShowBadgeSuit(item, badgeData, cardInfo.wearBadgeUids)
    end
  end
  
  effectList.numItems = #effect
end

function BadgeOverviewWindow.ShowBadgeAttribute(attributeCom, badgeInfo)
  local main = attributeCom:GetChild("Attribute2")
  local mainData = TableData.GetConfig(badgeInfo.mainAttribute, "BaseBadgeAttribute")
  if mainData then
    ChangeUIController(main, "c1", BadgeMgr.mainAttributeCtr[mainData.type])
    UIUtil.SetText(main, BadgeData.GetAttributeNameByInfo(mainData.type), "NameTxt")
    UIUtil.SetText(main, BadgeData.GetAttribute(badgeInfo.attributeLevels[badgeInfo.mainAttribute], badgeInfo.mainAttribute, false), "NumberTxt")
  end
  local sort = BadgeMgr.viceAttributeCtr
  local newViceAttribute = {}
  local show
  for i, v in pairs(badgeInfo.viceAttributes) do
    local data = TableData.GetConfig(v, "BaseBadgeAttribute")
    if data then
      table.insert(newViceAttribute, data)
    end
    if badgeInfo.attributeLevels[v] and badgeInfo.attributeLevels[v] > 0 then
      show = true
    end
  end
  if #newViceAttribute > 1 then
    table.sort(newViceAttribute, function(a, b)
      if sort[a.type] and sort[b.type] then
        return sort[a.type] < sort[b.type]
      end
      return false
    end)
  end
  local attributeList = attributeCom:GetChild("AttributeList")
  
  function attributeList.itemRenderer(i, item)
    local data = newViceAttribute[i + 1]
    ChangeUIController(item, "c1", sort[data.type])
    UIUtil.SetText(item, BadgeData.GetAttributeNameByInfo(data.type), "NameTxt")
    UIUtil.SetText(item, BadgeData.GetAttribute(badgeInfo.attributeLevels[data.id], data.id, false), "NumberTxt")
    if show then
      UIUtil.SetText(item:GetChild("LevelUpNumber"), badgeInfo.attributeLevels[data.id], "NumberTxt")
      ChangeUIController(item:GetChild("LevelUpNumber"), "c1", badgeInfo.attributeLevels[data.id] and badgeInfo.attributeLevels[data.id] > 0 and 0 or 2)
      ChangeUIController(item, "c4", 1)
    else
      ChangeUIController(item, "c4", 0)
    end
    if showNewTag and BadgeMgr.newTag[badgeInfo.badgeUid] and table.contain(BadgeMgr.newTag[badgeInfo.badgeUid], data.id) then
      ChangeUIController(item, "c3", 1)
    else
      ChangeUIController(item, "c3", 0)
    end
  end
  
  attributeList.numItems = #newViceAttribute
end

function BadgeOverviewWindow.ShowBadgeSuit(suitCom, badgeData, wearBadgeUids)
  local suitGroupData = TableData.GetConfig(badgeData.suit_group_id, "BaseBadgeSuitGroup")
  local wearState = suitCom:GetChild("WearState")
  if suitGroupData then
    UIUtil.SetText(suitCom, suitGroupData.name(), "NameTxt")
    local suitList = suitCom:GetChild("EffectList")
    local allSuitId = {}
    
    function suitList.itemRenderer(i, suit)
      local suitData = TableData.GetConfig(suitGroupData.suit_id[i + 1], "BaseBadgeSuit")
      if suitData then
        UIUtil.SetText(suit, suitData.des(), "WordTxt")
        if wearBadgeUids and BadgeMgr.CheckSuit(wearBadgeUids, suitData, badgeData) then
          ChangeUIController(suit, "c1", 1)
        else
          ChangeUIController(suit, "c1", 0)
        end
        for _, v in pairs(suitData.badge_ids) do
          allSuitId[v] = true
        end
      else
        ChangeUIController(suit, "c1", 0)
      end
    end
    
    suitList.numItems = #suitGroupData.suit_id
    suitList:ResizeToFit()
    wearState:GetChild("PicLoader").url = UIUtil.GetResUrl(suitGroupData.icon)
    local partNum = 0
    for i, v in ipairs(wearBadgeUids) do
      local info = ActorData.GetBadgeInfoByUid(v)
      if info then
        local teamBadge = TableData.GetConfig(info.badgeId, "BaseBadge")
        if teamBadge then
          ChangeUIController(wearState:GetChild("Mark" .. teamBadge.type), "c1", allSuitId[info.badgeId] and 1 or 0)
          partNum = partNum + 1
        end
      end
    end
    ChangeUIController(wearState, "c1", partNum >= 3 and 1 or 0)
  end
end

function BadgeOverviewWindow.ShowCardWarnMask(maskRoot, wearCardId)
  local cardInfo = CardData.GetCardDataById(wearCardId)
  local bol = {}
  if cardInfo then
    local info, teamBadge
    for i, v in ipairs(cardInfo.wearBadgeUids) do
      info = ActorData.GetBadgeInfoByUid(v)
      if info then
        teamBadge = TableData.GetConfig(info.badgeId, "BaseBadge")
        if teamBadge then
          bol[teamBadge.type] = true
        end
      end
    end
  end
  for i = 1, 3 do
    ChangeUIController(maskRoot:GetChild("Mark" .. i), "c1", bol[i] and 1 or 0)
  end
  local cardList = CardData.GetSortCardList()
end

function BadgeOverviewWindow.CheckHave(findType)
  local all = ActorData.GetAllBadge()
  local teamBadge
  for i, v in pairs(all) do
    if 0 == v.wearCardId then
      teamBadge = TableData.GetConfig(v.badgeId, "BaseBadge")
      if teamBadge and not findType[teamBadge.type] then
        return true
      end
    end
  end
end

function BadgeOverviewWindow.InitBtn()
  uis.Main.CardEmpty.WordTxt.text = T(1730)
  UIUtil.SetText(uis.Main.RecommendWearBtn, T(1724))
  uis.Main.RecommendWearBtn.onClick:Set(function()
    if nil == cardId then
      FloatTipsUtil.ShowWarnTips(T(1726))
      return
    end
    OpenWindow(WinResConfig.BadgeRecommendWindow.name, nil, cardId)
  end)
  uis.Main.AllWearBtn.onClick:Set(function()
    if nil == cardId then
      FloatTipsUtil.ShowWarnTips(T(1726))
      return
    end
    local cardInfo = CardData.GetCardDataById(cardId)
    if nil == cardInfo then
      return
    end
    local tempUid = cardInfo.wearBadgeUids
    if table.getLen(tempUid) > 2 then
      BadgeService.TakeoffBadgeReq(cardId, tempUid, function()
        if uis then
          BadgeOverviewWindow.UpdateCardList(true)
          BadgeOverviewWindow.ShowBadgeInfo(cardId)
          BadgeOverviewWindow.InitHomePartData(cardId)
          BadgeOverviewWindow.UpdateAutoWearState()
        end
      end)
    else
      BadgeOverviewWindow.AutoWear()
    end
  end)
  UIUtil.SetText(uis.Main.StateBtn, T(1722), "Word1Txt")
  UIUtil.SetText(uis.Main.StateBtn, T(1723), "Word2Txt")
  UIUtil.SetText(uis.Main.GoWearBtn, T(1725))
  uis.Main.GoWearBtn.onClick:Set(function()
    UIMgr:SetWindowArgs(WinResConfig.BadgeWindow.name, {cardId})
    UIMgr:CloseWindow(WinResConfig.BadgeOverviewWindow.name)
  end)
  uis.Main.CloseBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.BadgeOverviewWindow.name)
  end)
end

function BadgeOverviewWindow.AutoWear()
  local Req = function(part)
    local newPart = {}
    for i, v in pairs(part) do
      if v then
        table.insert(newPart, v)
      end
    end
    if #newPart > 0 then
      BadgeService.WearBadgeReq(cardId, newPart, function()
        if uis then
          BadgeOverviewWindow.UpdateCardList(true)
          BadgeOverviewWindow.ShowBadgeInfo(cardId)
          BadgeOverviewWindow.InitHomePartData(cardId)
          BadgeOverviewWindow.UpdateAutoWearState()
        end
      end)
    end
    if 3 ~= #newPart then
      FloatTipsUtil.ShowWarnTips(T(1256))
    end
  end
  local bol, part = BadgeOverviewWindow.GetSuitPartByWear()
  if bol then
    Req(part)
    return
  end
  bol, part = BadgeOverviewWindow.GetSuitPart()
  if not bol then
    bol, part = BadgeOverviewWindow.FindMaxLvPart(3)
  end
  Req(part)
end

function BadgeOverviewWindow.UpdateAutoWearState()
  local bol = true
  for type = 1, 3 do
    if nil == homePartData[type] then
      bol = false
    end
  end
  ChangeUIController(uis.Main.AllWearBtn, "c1", bol and 1 or 0)
end

function BadgeOverviewWindow.InitHomePartData(cardId)
  local cardInfo = CardData.GetCardDataById(cardId)
  if cardInfo then
    homePartData = {}
    for i, v in ipairs(cardInfo.wearBadgeUids) do
      local info = ActorData.GetBadgeInfoByUid(v)
      if info then
        local teamBadge = TableData.GetConfig(info.badgeId, "BaseBadge")
        if teamBadge then
          homePartData[teamBadge.type] = {data = teamBadge, info = info}
        end
      end
    end
  end
end

local GetAllSuitSortData = function(suitId)
  local suitData = {}
  local newId = {}
  for _, v in pairs(suitId) do
    local data = TableData.GetConfig(v, "BaseBadgeSuit")
    if data then
      table.insert(suitData, data)
      local new = {}
      for i = 1, #data.badge_ids do
        new[data.badge_ids[i]] = true
      end
      newId[v] = new
    end
  end
  table.sort(suitData, function(a, b)
    if a.equip_num == b.equip_num then
      return a.id < b.id
    else
      return a.equip_num > b.equip_num
    end
  end)
  return suitData, newId
end

function BadgeOverviewWindow.FindMaxLvPart(equipNum, addFun, partTabal)
  local badges = ActorData.GetAllBadge()
  local config = TableData.GetTable("BaseBadge")
  local part = {
    [1] = nil,
    [2] = nil,
    [3] = nil
  }
  local partOldIndex = {}
  local partOldData = {}
  local data, oldIndex, oldData
  local SetPart = function(i)
    part[data.type] = badges[i].badgeUid
    partOldIndex[data.type] = i
    partOldData[data.type] = config[badges[i].badgeId]
  end
  for i = 1, #badges do
    if nil == addFun or addFun(badges[i].badgeId) then
      data = config[badges[i].badgeId]
      if data and (nil == partTabal or nil == partTabal[data.type]) and (0 == badges[i].wearCardId or badges[i].wearCardId == cardId) then
        if nil == part[data.type] then
          SetPart(i)
        else
          oldIndex = partOldIndex[data.type]
          oldData = partOldData[data.type]
          if badges[i].level > badges[oldIndex].level then
            SetPart(i)
          elseif badges[i].level == badges[oldIndex].level then
            if data.star > oldData.star then
              SetPart(i)
            elseif data.star == oldData.star then
              if #badges[i].viceAttributes > #badges[oldIndex].viceAttributes then
                SetPart(i)
              elseif #badges[i].viceAttributes == #badges[oldIndex].viceAttributes and badges[i].badgeUid > badges[oldIndex].badgeUid then
                SetPart(i)
              end
            end
          end
        end
      end
    end
  end
  if partTabal then
    for i, v in pairs(partTabal) do
      part[i] = v
    end
  end
  local num = 0
  for i = 1, 3 do
    if part[i] then
      num = num + 1
    end
  end
  return equipNum <= num, part
end

function BadgeOverviewWindow.GetSuitPart()
  local cardData = TableData.GetConfig(cardId, "BaseCard")
  if cardData.badge_suit_ids then
    local groupData, tempId, part, bol
    for i = 1, #cardData.badge_suit_ids do
      groupData = TableData.GetConfig(cardData.badge_suit_ids[i], "BaseBadgeSuitGroup")
      if groupData and groupData.suit_id then
        local sortData, newBadgeId = GetAllSuitSortData(groupData.suit_id)
        for sortIndex = 1, #sortData do
          tempId = sortData[sortIndex].id
          bol, part = BadgeOverviewWindow.FindMaxLvPart(sortData[sortIndex].equip_num, function(tempBadgeId)
            return newBadgeId[tempId][tempBadgeId]
          end)
          if bol and part then
            if 3 == table.getLen(part) then
              return bol, part
            end
            bol, part = BadgeOverviewWindow.FindMaxLvPart(3, nil, part)
            return true, part
          end
        end
      end
    end
  end
end

local GetFindSuitId = function()
  for type = 1, 3 do
    if homePartData[type] then
      return homePartData[type].data.suit_group_id
    end
  end
end
local GetWearUid = function()
  local uid = {}
  for type = 1, 3 do
    if homePartData[type] then
      uid[type] = homePartData[type].info.badgeUid
    end
  end
  return uid
end

function BadgeOverviewWindow.GetSuitPartByWear()
  local groupId = GetFindSuitId()
  local wearUid = GetWearUid()
  if groupId and table.getLen(wearUid) > 0 then
    local tempId, part, bol
    local groupData = TableData.GetConfig(groupId, "BaseBadgeSuitGroup")
    if groupData and groupData.suit_id then
      local sortData, newBadgeId = GetAllSuitSortData(groupData.suit_id)
      for sortIndex = 1, #sortData do
        tempId = sortData[sortIndex].id
        bol, part = BadgeOverviewWindow.FindMaxLvPart(sortData[sortIndex].equip_num, function(tempBadgeId)
          return newBadgeId[tempId][tempBadgeId]
        end, wearUid)
        if bol and part then
          if 3 == table.getLen(part) then
            return bol, part
          end
          bol, part = BadgeOverviewWindow.FindMaxLvPart(3, nil, part)
          return true, part
        end
      end
      wearUid = part and table.getLen(part) > table.getLen(wearUid) and part or wearUid
      bol, part = BadgeOverviewWindow.FindMaxLvPart(3, nil, wearUid)
      if table.getLen(part) > 0 then
        return true, part
      end
    end
  end
end

function BadgeOverviewWindow.OnClose()
  uis = nil
  contentPane = nil
  ResourceManager.UnloadTexture(maskTexture)
  maskTexture = nil
  cardId = nil
  choiceData = nil
  cardListData = nil
  homePartData = nil
end

function BadgeOverviewWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.BadgeWindow.RECOMMEND_WEAR then
    BadgeOverviewWindow.UpdateCardList(true)
    BadgeOverviewWindow.ShowBadgeInfo(para)
    BadgeOverviewWindow.InitHomePartData(para)
    BadgeOverviewWindow.UpdateAutoWearState()
  end
end

return BadgeOverviewWindow
