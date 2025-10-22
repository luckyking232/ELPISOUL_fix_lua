require("PlayerInfo_ChoiceHeadWindowByName")
local ChoiceHeadWindow = {}
local uis, contentPane, curSelectTabIndex, curSelectCardId, curSelectCardFashionId, curSelectHeadId, curSelectHeadRectId, curHeadItemList, curHeadRectItemList
local TAB_ENUM = {
  MEMBER = 0,
  OTHER = 1,
  HEAD_RECT = 2
}
local notPlayAnim, defaultPage

function ChoiceHeadWindow.ReInitData()
end

function ChoiceHeadWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.ChoiceHeadWindow.package, WinResConfig.ChoiceHeadWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    defaultPage = bridgeObj.argTable[1]
    uis = GetPlayerInfo_ChoiceHeadWindowUis(contentPane)
    local list = uis.Main.ChoiceHeadTips.HeadList
    list:SetVirtual()
    ChoiceHeadWindow.InitBtn()
    notPlayAnim = true
    ChoiceHeadWindow.UpdateTab()
    notPlayAnim = nil
  end)
end

function ChoiceHeadWindow.UpdateDefaultTabIndex()
  local headInfo = ActorData.GetHeadInfo()
  if headInfo.fashionId > 0 then
    return TAB_ENUM.MEMBER
  elseif headInfo.headId > 0 then
    return TAB_ENUM.OTHER
  end
  return TAB_ENUM.MEMBER
end

function ChoiceHeadWindow.UpdateTab()
  local tabList = {
    {
      tabIndex = TAB_ENUM.MEMBER,
      title = T(11410),
      btn = uis.Main.ChoiceHeadTips.Tab1Btn,
      touchCallback = ChoiceHeadWindow.UpdateInfo
    },
    {
      tabIndex = TAB_ENUM.OTHER,
      title = T(11411),
      btn = uis.Main.ChoiceHeadTips.Tab2Btn,
      touchCallback = ChoiceHeadWindow.UpdateInfo
    },
    {
      tabIndex = TAB_ENUM.HEAD_RECT,
      title = T(11412),
      btn = uis.Main.ChoiceHeadTips.Tab3Btn,
      touchCallback = ChoiceHeadWindow.UpdateInfo
    }
  }
  local defaultIndex = ChoiceHeadWindow.UpdateDefaultTabIndex()
  if defaultPage then
    defaultIndex = defaultPage
  end
  for i, v in ipairs(tabList) do
    UIUtil.SetBtnText(v.btn, v.title)
    v.btn.onClick:Add(v.touchCallback)
    v.btn.data = v.tabIndex
    v.btn.testEnableOnClick = ChoiceHeadWindow.TestEnableFunction
    if defaultIndex == v.tabIndex then
      v.btn:FireClick(false, true)
    end
  end
end

function ChoiceHeadWindow.TestEnableFunction(button)
  local index = button.data
  if index == TAB_ENUM.MEMBER then
    return true
  elseif index == TAB_ENUM.OTHER then
    curHeadItemList = ActorData.GetItemListByType(ProtoEnum.ITEM_TYPE.HEAD_ITEM)
    if #curHeadItemList > 0 then
      return true
    else
      FloatTipsUtil.ShowWarnTips(T(11413))
      return false
    end
  elseif index == TAB_ENUM.HEAD_RECT then
    curHeadRectItemList = ActorData.GetItemListByType(ProtoEnum.ITEM_TYPE.HEAD_RECT_ITEM)
    table.insert(curHeadRectItemList, 1, {
      itemData = {itemUid = 0, expireStamp = 0}
    })
    table.sort(curHeadRectItemList, function(a, b)
      if a.itemData.expireStamp > 0 and b.itemData.expireStamp > 0 then
        return a.itemData.expireStamp < b.itemData.expireStamp
      else
        return a.itemData.expireStamp > b.itemData.expireStamp
      end
    end)
    if #curHeadRectItemList > 0 then
      return true
    else
      FloatTipsUtil.ShowWarnTips(T(11414))
      return false
    end
  end
end

function ChoiceHeadWindow.GetMemberList()
  local allCardList = CardData.GetSortCardList()
  local actorHead = ActorData.GetHeadInfo()
  local selectCardId, useFashionId
  if actorHead and actorHead.fashionId > 0 then
    useFashionId = actorHead.fashionId
    for _, v in ipairs(allCardList) do
      local cardConfig = TableData.GetConfig(v.cardId, "BaseCard")
      local contain, index = table.contain(cardConfig.fashion_ids, actorHead.fashionId)
      if true == contain then
        selectCardId = v.cardId
        break
      else
        local ownFashionIds = v.ownFashionIds
        if ownFashionIds and ownFashionIds[actorHead.fashionId] then
          selectCardId = v.cardId
          break
        end
      end
    end
  else
    selectCardId = allCardList[1].cardId
  end
  return allCardList, selectCardId, useFashionId
end

function ChoiceHeadWindow.TouchCardFashion(eventContext)
  local fashionInfo = eventContext.sender.data
  local actorInfo = ActorData.GetActorInfo()
  local tempInfo = SimpleCopy(actorInfo)
  tempInfo.actorHead = {
    fashionId = fashionInfo.fashionId,
    headId = 0,
    headRectId = tempInfo.actorHead and tempInfo.actorHead.headRectId or 0,
    headRectStamp = tempInfo.actorHead and tempInfo.actorHead.headRectStamp,
    headRectExtra = tempInfo.actorHead and tempInfo.actorHead.headRectExtra,
    headRectItemUid = tempInfo.actorHead and tempInfo.actorHead.headRectItemUid
  }
  if 0 ~= tempInfo.actorHead.headRectId and 0 == tempInfo.actorHead.headRectItemUid then
    local itemInfo = ActorData.GetItemInfoById(tempInfo.actorHead.headRectId)
    if itemInfo then
      tempInfo.actorHead.headRectItemUid = itemInfo.itemUid
    end
  end
  local detail = uis.Main.ChoiceHeadTips.Details
  UIUtil.ShowPlayerHead(tempInfo, detail.Head.root)
  curSelectCardFashionId = fashionInfo.fashionId
  if fashionInfo.unlock == false then
    detail.c1Ctr.selectedIndex = 2
    detail.Lock.WordTxt.text = T(11416, NumberUtil.IntToRome(fashionInfo.needQuality))
  elseif actorInfo.actorHead and actorInfo.actorHead.fashionId == fashionInfo.fashionId then
    detail.c1Ctr.selectedIndex = 0
    detail.InUse.WordTxt.text = T(11415)
  else
    detail.c1Ctr.selectedIndex = 1
    UIUtil.SetBtnText(detail.UseBtn, T(11417))
    detail.UseBtn.soundFmod = SOUND_EVENT_ENUM.CARD_SKILL_LV_UP
    detail.UseBtn.onClick:Set(function()
      ActorService.ChangeHeadReq(tempInfo.actorHead)
    end)
  end
end

function ChoiceHeadWindow.UpdateDetailInfo()
  local list = uis.Main.ChoiceHeadTips.HeadList
  list:RefreshVirtualList()
  local used = false
  local actorInfo = ActorData.GetActorInfo()
  if curSelectCardFashionId then
    if actorInfo.actorHead and actorInfo.actorHead.fashionId == curSelectCardFashionId then
      used = true
    end
  elseif curSelectHeadId then
    if actorInfo.actorHead and actorInfo.actorHead.headId == curSelectHeadId then
      used = true
    end
  elseif curSelectHeadRectId and actorInfo.actorHead and actorInfo.actorHead.headRectId == curSelectHeadRectId then
    used = true
  end
  if used then
    local detail = uis.Main.ChoiceHeadTips.Details
    detail.c1Ctr.selectedIndex = 0
    detail.InUse.WordTxt.text = T(11415)
  end
end

function ChoiceHeadWindow.UpdateInfo(eventContext)
  local index = eventContext.sender.data
  if index == curSelectTabIndex then
    return
  end
  curSelectTabIndex = index
  curSelectCardId = nil
  curSelectCardFashionId = nil
  curSelectHeadId = nil
  curSelectHeadRectId = nil
  local detail = uis.Main.ChoiceHeadTips.Details
  detail.c2Ctr.selectedIndex = curSelectTabIndex
  local callBack = function()
    if curSelectTabIndex == TAB_ENUM.MEMBER then
      ChoiceHeadWindow.UpdateMemberHead()
    elseif curSelectTabIndex == TAB_ENUM.OTHER then
      ChoiceHeadWindow.UpdateOtherHead()
    elseif curSelectTabIndex == TAB_ENUM.HEAD_RECT then
      ChoiceHeadWindow.UpdateHeadRect()
    end
  end
  local trans = uis.Main.ChoiceHeadTips.root:GetTransition("up")
  if trans then
    trans:ClearHooks()
    trans:SetHook("sign", callBack)
    if notPlayAnim then
      callBack()
    else
      trans:Play()
    end
  end
end

function ChoiceHeadWindow.UpdateMemberHead()
  local headList = uis.Main.ChoiceHeadTips.HeadList
  headList.selectedIndex = -1
  local cardList, useFashionId
  cardList, curSelectCardId, useFashionId = ChoiceHeadWindow.GetMemberList()
  local toIndex = 0
  for i = 1, #cardList do
    if cardList[i].cardId == curSelectCardId then
      toIndex = i - 1
      break
    end
  end
  
  function headList.itemRenderer(index, item)
    local choiceHeadPic = item:GetChild("ChoiceHeadPic")
    choiceHeadPic.alpha = 1
    choiceHeadPic:SetScale(1, 1)
    local cardInfo = cardList[index + 1]
    local cardConfig = TableData.GetConfig(cardInfo.cardId, "BaseCard")
    local fashionId = cardConfig.fashion_id
    item.data = cardConfig
    ChangeUIController(choiceHeadPic, "type", 0)
    local loader = choiceHeadPic:GetChild("HeadBg"):GetChild("PicLoader")
    UIUtil.SetHeadByFaceId(fashionId, loader, HEAD_ICON_TYPE_ENUM.RECT)
    choiceHeadPic:GetChild("Use"):GetChild("WordTxt").text = T(11415)
    item.onClick:Set(function()
      headList.selectedIndex = index
      ChoiceHeadWindow.TouchCardItem(cardConfig)
    end)
    ChangeUIController(choiceHeadPic, "time", 0)
    ChangeUIController(choiceHeadPic, "c1", 0)
    if cardInfo.cardId == curSelectCardId then
      item:FireClick(false, true)
      if useFashionId then
        ChangeUIController(choiceHeadPic, "c1", 1)
      end
    end
  end
  
  headList.numItems = #cardList
  if toIndex then
    headList:ScrollToView(toIndex)
  end
end

function ChoiceHeadWindow.UpdateOtherHead()
  local headList = uis.Main.ChoiceHeadTips.HeadList
  headList.selectedIndex = -1
  local actorInfo = ActorData.GetActorInfo()
  if actorInfo.actorHead and actorInfo.actorHead.headId > 0 then
    curSelectHeadId = actorInfo.actorHead.headId
  else
    curSelectHeadId = curHeadItemList[1].itemData.itemId
  end
  local toIndex = 0
  for i = 1, #curHeadItemList do
    if curHeadItemList[i].itemConfig.id == curSelectHeadId then
      toIndex = i - 1
      break
    end
  end
  
  function headList.itemRenderer(index, item)
    local choiceHeadPic = item:GetChild("ChoiceHeadPic")
    local itemConfig = curHeadItemList[index + 1].itemConfig
    item.data = itemConfig
    ChangeUIController(choiceHeadPic, "type", 0)
    local loader = choiceHeadPic:GetChild("HeadBg"):GetChild("PicLoader")
    loader.url = UIUtil.GetResUrl(itemConfig.icon)
    choiceHeadPic:GetChild("Use"):GetChild("WordTxt").text = T(11415)
    item.onClick:Set(function()
      headList.selectedIndex = index
      ChoiceHeadWindow.TouchOtherItem(item.data)
    end)
    ChangeUIController(choiceHeadPic, "time", 0)
    ChangeUIController(choiceHeadPic, "c1", 0)
    if itemConfig.id == curSelectHeadId then
      item:FireClick(false, true)
      if actorInfo.actorHead and actorInfo.actorHead.headId > 0 then
        ChangeUIController(choiceHeadPic, "c1", 1)
      end
    end
  end
  
  headList.numItems = #curHeadItemList
  if toIndex then
    headList:ScrollToView(toIndex)
  end
end

function ChoiceHeadWindow.UpdateHeadRect()
  local headList = uis.Main.ChoiceHeadTips.HeadList
  headList.selectedIndex = -1
  local actorInfo = ActorData.GetActorInfo()
  if 0 ~= actorInfo.actorHead.headRectId and 0 == actorInfo.actorHead.headRectItemUid then
    local itemInfo = ActorData.GetItemInfoById(actorInfo.actorHead.headRectId)
    if itemInfo then
      actorInfo.actorHead.headRectItemUid = itemInfo.itemUid
    end
  end
  if actorInfo.actorHead and actorInfo.actorHead.headRectId and ActorData.GetItemInfoByUid(actorInfo.actorHead.headRectItemUid) then
    curSelectHeadRectId = actorInfo.actorHead.headRectItemUid
  else
    curSelectHeadRectId = 0
  end
  local toIndex = 0
  for i = 1, #curHeadRectItemList do
    if curHeadRectItemList[i].itemConfig == nil then
      if 0 == curSelectHeadRectId then
        toIndex = i - 1
        break
      end
    elseif curHeadRectItemList[i].itemData.itemUid == curSelectHeadRectId then
      toIndex = i - 1
      break
    end
  end
  
  function headList.itemRenderer(index, item)
    local choiceHeadPic = item:GetChild("ChoiceHeadPic")
    ChangeUIController(choiceHeadPic, "type", 1)
    local loader = choiceHeadPic:GetChild("FramePic"):GetChild("PicLoader")
    choiceHeadPic:GetChild("Use"):GetChild("WordTxt").text = T(11415)
    ChangeUIController(choiceHeadPic, "c1", 0)
    local itemConfig = curHeadRectItemList[index + 1].itemConfig
    if nil == itemConfig then
      itemConfig = {itemUid = 0}
      loader.url = UIUtil.GetResUrl("PlayerHeadFrame:Frame_1000")
      ChangeUIController(choiceHeadPic, "time", 0)
      ChangeUIController(choiceHeadPic:GetChild("FramePic"), "rank", 0)
    else
      loader.url = UIUtil.GetResUrl(itemConfig.icon)
      local itemInfo = curHeadRectItemList[index + 1].itemData
      if itemInfo and itemInfo.expireStamp > 0 then
        UIUtil.SetText(choiceHeadPic:GetChild("Time"), TimeUtil.FormatEnTime(itemInfo.expireStamp - LoginData.GetCurServerTime()), "TimeTxt")
        ChangeUIController(choiceHeadPic, "time", 1)
      else
        ChangeUIController(choiceHeadPic, "time", 0)
      end
      item.data = nil
      if itemInfo and itemInfo.count > 0 and itemConfig and itemConfig.effect_value and itemConfig.effect_value == "1" then
        UIUtil.SetText(choiceHeadPic:GetChild("FramePic"), itemInfo.count, "RankNumberTxt")
        ChangeUIController(choiceHeadPic:GetChild("FramePic"), "rank", 1)
      else
        ChangeUIController(choiceHeadPic:GetChild("FramePic"), "rank", 0)
      end
    end
    item.onClick:Set(function()
      headList.selectedIndex = index
      itemConfig.itemUid = curHeadRectItemList[index + 1].itemData.itemUid
      ChoiceHeadWindow.TouchHeadRectItem(itemConfig)
    end)
    if curHeadRectItemList[index + 1].itemData.itemUid == curSelectHeadRectId then
      item:FireClick(false, true)
      ChangeUIController(choiceHeadPic, "c1", 1)
    end
  end
  
  headList.numItems = #curHeadRectItemList
  if toIndex then
    headList:ScrollToView(toIndex)
  end
end

function ChoiceHeadWindow.TouchCardItem(cardConfig)
  if curSelectTabIndex == TAB_ENUM.MEMBER then
    curSelectCardId = cardConfig.id
    curSelectCardFashionId = nil
    local detail = uis.Main.ChoiceHeadTips.Details
    detail.NameTxt.text = cardConfig.name()
    local subHeadList = detail.HeadList
    subHeadList:RemoveChildrenToPool()
    local fashionList = CardMgr.GetCardAllFashionIdForChooseHead(curSelectCardId)
    local actorInfo = ActorData.GetActorInfo()
    if actorInfo.actorHead then
      for i, v in ipairs(fashionList) do
        if v.fashionId == actorInfo.actorHead.fashionId then
          curSelectCardFashionId = v.fashionId
          break
        end
      end
    end
    if nil == curSelectCardFashionId then
      curSelectCardFashionId = fashionList[1].fashionId
    end
    
    function subHeadList.itemRenderer(_index, _item)
      local fashionInfo = fashionList[_index + 1]
      _item.data = fashionInfo
      local choiceHeadPic = _item:GetChild("ChoiceHeadPic")
      local loader = choiceHeadPic:GetChild("HeadBg"):GetChild("PicLoader")
      UIUtil.SetHeadByFaceId(fashionInfo.fashionId, loader, HEAD_ICON_TYPE_ENUM.RECT)
      _item.onClick:Add(ChoiceHeadWindow.TouchCardFashion)
      if curSelectCardFashionId == fashionInfo.fashionId then
        _item:FireClick(false, true)
        subHeadList:ScrollToView(_index)
      end
    end
    
    subHeadList.numItems = #fashionList
  end
end

function ChoiceHeadWindow.TouchOtherItem(itemConfig)
  if curSelectTabIndex == TAB_ENUM.OTHER then
    curSelectHeadId = itemConfig.id
    local actorInfo = ActorData.GetActorInfo()
    local tempInfo = SimpleCopy(actorInfo)
    tempInfo.actorHead = {
      fashionId = 0,
      headId = curSelectHeadId,
      headRectId = tempInfo.actorHead and tempInfo.actorHead.headRectId or 0,
      headRectStamp = tempInfo.actorHead and tempInfo.actorHead.headRectStamp,
      headRectExtra = tempInfo.actorHead and tempInfo.actorHead.headRectExtra,
      headRectItemUid = tempInfo.actorHead and tempInfo.actorHead.headRectItemUid
    }
    local detail = uis.Main.ChoiceHeadTips.Details
    UIUtil.ShowPlayerHead(tempInfo, detail.Head.root)
    detail.NameTxt.text = itemConfig.name()
    if actorInfo.actorHead and actorInfo.actorHead.headId == curSelectHeadId then
      detail.c1Ctr.selectedIndex = 0
      detail.InUse.WordTxt.text = T(11415)
    else
      detail.c1Ctr.selectedIndex = 1
      UIUtil.SetBtnText(detail.UseBtn, T(11417))
      detail.UseBtn.onClick:Set(function()
        ActorService.ChangeHeadReq(tempInfo.actorHead)
      end)
    end
    
    function detail.WordList.itemRenderer(i, word)
      UIUtil.SetText(word, itemConfig.remark())
    end
    
    if itemConfig.remark then
      detail.WordList.numItems = 1
    else
      detail.WordList.numItems = 0
    end
  end
end

function ChoiceHeadWindow.TouchHeadRectItem(itemConfig)
  if curSelectTabIndex == TAB_ENUM.HEAD_RECT then
    curSelectHeadRectId = itemConfig.itemUid
    local actorInfo = ActorData.GetActorInfo()
    local tempInfo = SimpleCopy(actorInfo)
    tempInfo.actorHead = {
      fashionId = tempInfo.actorHead and tempInfo.actorHead.fashionId,
      headId = tempInfo.actorHead and tempInfo.actorHead.headId,
      headRectStamp = tempInfo.actorHead and tempInfo.actorHead.headRectStamp,
      headRectExtra = tempInfo.actorHead and tempInfo.actorHead.headRectExtra,
      headRectId = itemConfig.id,
      headRectItemUid = curSelectHeadRectId
    }
    local detail = uis.Main.ChoiceHeadTips.Details
    UIUtil.ShowPlayerHead(tempInfo, detail.Head.root)
    if itemConfig.name then
      detail.NameTxt.text = itemConfig.name()
    else
      detail.NameTxt.text = T(11418)
    end
    
    function detail.WordList.itemRenderer(i, word)
      UIUtil.SetText(word, itemConfig.remark())
    end
    
    if itemConfig.remark then
      detail.WordList.numItems = 1
    else
      detail.WordList.numItems = 0
    end
    if actorInfo.actorHead and actorInfo.actorHead.headRectItemUid == curSelectHeadRectId then
      detail.c1Ctr.selectedIndex = 0
      detail.InUse.WordTxt.text = T(11415)
    else
      detail.c1Ctr.selectedIndex = 1
      UIUtil.SetBtnText(detail.UseBtn, T(11417))
      detail.UseBtn.onClick:Set(function()
        ActorService.ChangeHeadReq(tempInfo.actorHead)
      end)
    end
  end
end

function ChoiceHeadWindow.InitBtn()
  uis.Main.TouchScreenBtn.onClick:Add(ChoiceHeadWindow.TouchClose)
end

function ChoiceHeadWindow.TouchClose()
  UIMgr:CloseWindow(WinResConfig.ChoiceHeadWindow.name)
end

function ChoiceHeadWindow.OnClose()
  uis = nil
  contentPane = nil
  curSelectCardId = nil
  curSelectTabIndex = nil
  curSelectCardFashionId = nil
  curSelectHeadId = nil
  curSelectHeadRectId = nil
  curHeadItemList = nil
  curHeadRectItemList = nil
  notPlayAnim = nil
  defaultPage = nil
end

function ChoiceHeadWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.Common.E_MSG_ACTOR_INFO_CHANGE then
    ChoiceHeadWindow.UpdateDetailInfo()
    if curSelectTabIndex and curSelectTabIndex == TAB_ENUM.HEAD_RECT then
      curSelectTabIndex = nil
      uis.Main.ChoiceHeadTips.Tab3Btn.onClick:Call()
    end
  end
end

return ChoiceHeadWindow
