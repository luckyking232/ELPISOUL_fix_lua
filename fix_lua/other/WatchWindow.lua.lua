require("Watch_WatchWindowByName")
local WatchWindow = {}
local uis, contentPane, cardId, curShowIndex, infoFaceId, lastChoice, isPlayUp, newFashion, sortInverted, sortCardList, reverseCardList, jumpTb, showId
local maxLen = 5
local curListId

function WatchWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.WatchWindow.package, WinResConfig.WatchWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetWatch_WatchWindowUis(contentPane)
    UIUtil.SetHolderCenter(uis.Main.BackGround.BackGroundHolder)
    UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/NoiseUIBack/FX_ui_Watch_1000.prefab", uis.Main.BackGround.BackGroundHolder)
    local curInfo = bridgeObj.argTable[1]
    sortInverted = false
    WatchWindow.InitBtn()
    WatchWindow.UpdateTextDisplay()
    CardService.GetAllShowFashionReq(function()
      WatchWindow.ShowMask()
      WatchWindow.InitAllTabList()
      local info = ActorData.GetActorInfo()
      local showIndex = curInfo and curInfo.index - 1 or info.showFashionIndex
      WatchWindow.SetChangeFashion(showIndex)
    end)
  end)
end

function WatchWindow.InitAllTabList()
  newFashion = SimpleCopy(OprRecordUtil.GetRecord(PLAYER_OPERATION_ENUM.SPECIAL_FASHION_NEW))
  local tab = {
    [1] = {
      name = T(1969),
      type = 0
    },
    [2] = {
      name = T(1970),
      type = 1
    }
  }
  local list = uis.Main.ClothesSet.Set.TabList
  
  function list.itemRenderer(i, item)
    UIUtil.SetText(item, tab[i + 1].name, "WordTxt")
    ChangeUIController(item, "c1", tab[i + 1].type)
    item.onClick:Set(function()
      if list.selectedIndex ~= i then
        if 0 == tab[i + 1].type then
          local listData = WatchWindow.SetSelectCardFirst(CardData.GetSortCardList())
          if listData then
            WatchWindow.InitList(listData, tab[i + 1].type)
          end
          RedDotMgr.UpdateNode(RED_DOT_DATA_TYPE.WATCH)
        elseif 1 == tab[i + 1].type then
          local listData = WatchWindow.GetAllSpecialFashion()
          WatchWindow.InitList(listData, tab[i + 1].type)
        end
        list.selectedIndex = i
      end
    end)
    if 1 == tab[i + 1].type then
      RedDotMgr.AddNode({
        windowName = WinResConfig.WatchWindow.name,
        com = item,
        newFlagVisibleFunc = function()
          return RedDotWatch.ShowHome()
        end,
        dataType = RED_DOT_DATA_TYPE.WATCH,
        newFlagName = "new",
        onlyNew = true
      })
    end
  end
  
  list.numItems = #tab
  local tempFashion = TableData.GetConfig(ActorData.GetFaceId(), "BaseFashion")
  if tempFashion then
    if 1 == tempFashion.skin_type then
      curListId = tempFashion.card_id
      local listData = WatchWindow.SetSelectCardFirst(CardData.GetSortCardList(), 0)
      if listData then
        WatchWindow.InitList(listData, 0)
        list.selectedIndex = 0
      end
    else
      curListId = tempFashion.id
      local listData = WatchWindow.GetAllSpecialFashion()
      WatchWindow.InitList(listData, 1)
      list.selectedIndex = 1
    end
  end
  WatchWindow.ClearNew()
end

function WatchWindow.ClearNew()
  local ids = WatchWindow.GetAllSpecialFashion()
  for i, v in pairs(ids) do
    if CardData.FashionIsContain(v.id) and not table.contain(newFashion, v.id) then
      table.insert(newFashion, v.id)
    end
  end
  OprRecordUtil.SaveRecord(PLAYER_OPERATION_ENUM.SPECIAL_FASHION_NEW, newFashion)
end

function WatchWindow.GetAllSpecialFashion()
  local config = TableData.GetTable("BaseFashion")
  local tb = {}
  for i, v in pairs(config) do
    if 2 == v.skin_type then
      table.insert(tb, v)
    end
  end
  local aLock, bLock
  table.sort(tb, function(a, b)
    aLock = CardData.FashionIsContain(a.id)
    bLock = CardData.FashionIsContain(b.id)
    if aLock and not bLock then
      return true
    elseif not aLock and bLock then
      return false
    end
    return a.id < b.id
  end)
  return tb
end

function WatchWindow.SetSelectCardFirst(tb)
  for i = 1, #tb do
    if cardId == tb[i].cardId then
      local tempTb = SimpleCopy(tb[i])
      table.remove(tb, i)
      table.insert(tb, 1, tempTb)
      return tb
    end
  end
  return tb
end

function WatchWindow.ShowMask()
  local effect = UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/NoiseUIBack/FX_ui_watch_1000_mask.prefab", uis.Main.ClothesSet.EffectHolder)
  local mask = LuaUtil.FindChild(effect.transform, "LookGirl_background", true)
  if mask then
    LuaUtil.SetLocalPos(mask.gameObject, 1.5, 0, 0)
  end
end

function WatchWindow.UpdateTextDisplay()
  UIUtil.SetBtnText(uis.Main.ClothesSet.Set.ClothesBtn, T(568), T(569))
  UIUtil.SetBtnText(uis.Main.ClothesSet.Set.PositionBtn, T(570), T(571))
  uis.Main.ClothesSet.Set.Word.WordTxt.text = T(2033)
  uis.Main.ClothesSet.CardEmpty.WordTxt.text = T(2039)
end

function WatchWindow.InitList(CardList, type)
  local HeadList = uis.Main.ClothesSet.Set.HeadList
  HeadList:SetVirtual()
  HeadList.defaultItem = UIUtil.GetResUrl("Watch:CardHead")
  isPlayUp = true
  local tempI = 0
  
  function HeadList.itemRenderer(i, item)
    local btn = item:GetChild("CardHeadBtn")
    btn.soundFmod = SOUND_EVENT_ENUM.CARD_SELECT
    btn.changeStateOnClick = false
    if 0 == type then
      local configData = TableData.GetConfig(CardList[i + 1].cardId, "BaseCard")
      local data = TableData.GetConfig(CardList[i + 1].fashionId, "BaseFashion")
      UIUtil.SetText(btn, configData.name(), "CardNameTxt")
      if data then
        btn:GetChild("CardHeadPic"):GetChild("CardLoader").url = UIUtil.GetResUrl(data.head_icon_square)
      end
      btn.onClick:Set(function()
        local addFasfionId = 0 ~= CardList[i + 1].fashionId and CardList[i + 1].fashionId or configData.fashion_id
        if #showId < maxLen or curShowIndex then
          if curShowIndex and showId[curShowIndex] then
            if showId[curShowIndex] == addFasfionId then
              return
            end
            showId[curShowIndex] = addFasfionId
          else
            table.insert(showId, addFasfionId)
          end
          ActorService.SetCardFashionShowReq(showId, function(msg)
            if curShowIndex then
              ActorData.UpdateFashionPosInfo(curShowIndex, {})
            else
              ActorData.AddFashionPosInfo({})
            end
            if uis then
              showId = SimpleCopy(msg.actor.showFashionIds)
              lastChoice = nil
              local cIndex = curShowIndex and curShowIndex or #showId
              WatchWindow.SetChangeFashion(cIndex - 1)
            end
          end)
        end
      end)
      if curListId and curListId == CardList[i + 1].cardId then
        btn.selected = true
      else
        btn.selected = false
      end
      ChangeUIController(btn, "c1", configData.star - 1)
      ChangeUIController(btn, "type", 0)
      ChangeUIController(btn, "lock", 0)
      ChangeUIController(btn, "new", 0)
    else
      local data = CardList[i + 1]
      ChangeUIController(btn, "type", 1)
      UIUtil.SetText(btn, data.name(), "CardNameTxt")
      btn:GetChild("CardHeadPic"):GetChild("CardLoader").url = UIUtil.GetResUrl(data.head_icon_square)
      if CardData.FashionIsContain(data.id) then
        UIUtil.SetMoveText(btn:GetChild("Sign"):GetChild("MoveWord"), data.unlock_des(), "WordTxt")
        btn.onClick:Set(function()
          ChangeUIController(btn, "new", 0)
          btn.selected = true
          if #showId < maxLen or curShowIndex then
            if curShowIndex and showId[curShowIndex] then
              if showId[curShowIndex] == data.id then
                return
              end
              showId[curShowIndex] = data.id
            else
              table.insert(showId, data.id)
            end
            ActorService.SetCardFashionShowReq(showId, function(msg)
              if curShowIndex then
                ActorData.UpdateFashionPosInfo(curShowIndex, {})
              else
                ActorData.AddFashionPosInfo({})
              end
              if uis then
                showId = SimpleCopy(msg.actor.showFashionIds)
                lastChoice = nil
                local cIndex = curShowIndex and curShowIndex or #showId
                WatchWindow.SetChangeFashion(cIndex - 1)
              end
            end)
          end
        end)
        ChangeUIController(btn, "lock", 0)
      else
        btn.onClick:Set(function()
          FloatTipsUtil.ShowWarnTips(T(1971))
        end)
        UIUtil.SetMoveText(btn:GetChild("Lock"):GetChild("MoveWord"), data.unlock_des(), "WordTxt")
        ChangeUIController(btn, "lock", 1)
      end
      if curListId and curListId == CardList[i + 1].id then
        btn.selected = true
      else
        btn.selected = false
      end
      ChangeUIController(btn, "c1", data.star - 1)
      ChangeUIController(btn, "new", table.contain(newFashion, data.id) and 0 or 1)
    end
    if isPlayUp then
      btn.alpha = 0
      PlayUITrans(item, "up", nil, tempI * 0.05)
      tempI = tempI + 1
    end
  end
  
  HeadList.numItems = #CardList
  isPlayUp = nil
end

function WatchWindow.GetCardListByTime(inverted)
  local cardList = ActorData.GetCardList()
  local getTime = function(ownFashionIds)
    local time
    for i, v in pairs(ownFashionIds) do
      if nil == time then
        time = v
      else
        time = inverted and math.min(time, v) or math.max(time, v)
      end
    end
    time = time or 0
    return time
  end
  if #cardList > 1 then
    table.sort(cardList, function(a, b)
      local at = getTime(a.ownFashionIds)
      local bt = getTime(b.ownFashionIds)
      if at == bt then
        local aData = TableData.GetConfig(a.cardId, "BaseCard")
        local bData = TableData.GetConfig(b.cardId, "BaseCard")
        if aData.star and bData.star then
          if aData.star == bData.star then
            return a.cardId > b.cardId
          else
            return aData.star > bData.star
          end
        end
      elseif inverted then
        return at < bt
      else
        return at > bt
      end
    end)
  end
  return cardList
end

function WatchWindow.SetChangeFashion(choiceIndex)
  local list = uis.Main.ClothesSet.Set.BatchRegion.CardList
  local info = ActorData.GetActorInfo()
  showId = SimpleCopy(info.showFashionIds)
  if #info.showFashionIds < 1 then
    table.insert(showId, info.faceId)
  end
  
  function list.itemRenderer(i, item)
    if showId[i + 1] then
      ChangeUIController(item, "choice", choiceIndex == i and 1 or 0)
      local data = TableData.GetConfig(showId[i + 1], "BaseFashion")
      local cardPic = item:GetChild("CardPic")
      cardPic:GetChild("PicLoader").url = UIUtil.GetResUrl(data.head_icon_rect)
      ChangeUIController(item, "c2", i == info.showFashionIndex and 1 or 0)
      ChangeUIController(item, "c1", #showId > 1 and 1 or 0)
      cardPic.onClick:Set(function()
        if lastChoice ~= item then
          curShowIndex = i + 1
          ChangeUIController(lastChoice, "choice", 0)
          ChangeUIController(item, "choice", 1)
          WatchWindow.SetCardInfo(data.id, i + 1)
          ChangeController(uis.Main.ClothesSet.c2Ctr, 0)
          lastChoice = item
          curListId = nil
          isPlayUp = nil
          if 1 == data.skin_type and 0 ~= uis.Main.ClothesSet.Set.TabList.selectedIndex then
            uis.Main.ClothesSet.Set.TabList:GetChildAt(0).onClick:Call()
          elseif 2 == data.skin_type and 1 ~= uis.Main.ClothesSet.Set.TabList.selectedIndex then
            uis.Main.ClothesSet.Set.TabList:GetChildAt(1).onClick:Call()
          else
            uis.Main.ClothesSet.Set.HeadList:RefreshVirtualList()
          end
        end
      end)
      local delBtn = item:GetChild("DelBtn")
      delBtn.onClick:Set(function()
        local len = #showId
        table.remove(showId, i + 1)
        ActorService.SetCardFashionShowReq(showId, function(msg)
          ActorData.RemoveFashionPosInfo(i + 1)
          if uis then
            showId = SimpleCopy(msg.actor.showFashionIds)
            lastChoice = nil
            if len == i + 1 then
              WatchWindow.SetChangeFashion(#showId - 1)
            else
              WatchWindow.SetChangeFashion(i)
            end
          end
        end)
      end)
      if choiceIndex and choiceIndex == i then
        cardPic.onClick:Call()
      end
    else
      ChangeUIController(item, "c1", 2)
      ChangeUIController(item, "c2", 0)
      ChangeUIController(item, "choice", 0)
      local addBtn = item:GetChild("AddBtn")
      addBtn.onClick:Set(function()
        curListId = nil
        isPlayUp = nil
        curShowIndex = nil
        ChangeUIController(lastChoice, "choice", 0)
        ChangeUIController(item, "choice", 1)
        lastChoice = item
        WatchWindow.ClearShowInfo()
        ChangeController(uis.Main.ClothesSet.c2Ctr, 1)
        uis.Main.ClothesSet.Set.HeadList:RefreshVirtualList()
      end)
    end
  end
  
  list.numItems = maxLen
  ChangeController(uis.Main.ClothesSet.c2Ctr, choiceIndex and 0 or 1)
end

function WatchWindow.SetCardInfo(fashionId, index)
  local info = uis.Main.ClothesSet.CardInfo
  local fashionData = TableData.GetConfig(fashionId, "BaseFashion")
  local listFashion, cardInfo
  infoFaceId = fashionId
  if fashionData.card_id then
    listFashion = CardMgr.GetCardAllFashionId(fashionData.card_id)
    cardInfo = CardData.GetCardDataById(fashionData.card_id)
    local tempData = TableData.GetConfig(fashionData.card_id, "BaseCard")
    ChangeController(info.c3Ctr, 1)
    info.c1Ctr.selectedIndex = tempData.star - 1
    info.NameTxt.text = tempData.name()
    info.SubtitleTxt.text = tempData.name_english()
  else
    listFashion = {fashionId}
    info.c1Ctr.selectedIndex = fashionData.star - 1
    info.NameTxt.text = fashionData.name()
    info.SubtitleTxt.text = fashionData.name_english and fashionData.name_english() or ""
  end
  local list = info.CardClothes.HeadList
  local tempItem
  
  function list.itemRenderer(i, item)
    local data = TableData.GetConfig(listFashion[i + 1], "BaseFashion")
    item:GetChild("CardHeadPic"):GetChild("HeadLoader").url = UIUtil.GetResUrl(data.head_icon_rect)
    if cardInfo and cardInfo.ownFashionIds[data.id] or CardData.FashionIsContain(data.id) then
      ChangeUIController(item, "lock", 0)
      item.onClick:Set(function()
        if tempItem ~= item then
          showId[index] = data.id
          ActorService.SetCardFashionShowReq(showId, function(msg)
            ActorData.UpdateFashionPosInfo(index, {})
            if uis then
              showId = SimpleCopy(msg.actor.showFashionIds)
              lastChoice = nil
              WatchWindow.SetChangeFashion(index - 1)
              infoFaceId = data.id
              ChangeUIController(tempItem, "c1", 0)
              ChangeUIController(item, "c1", 1)
              tempItem = item
              UIUtil.SetCardShowSpineAutoAlpha(data.id, uis.Main.ClothesSet.Pic.PicLoader, uis.Main.ClothesSet.Pic.PicHolder)
            end
          end)
        end
      end)
    else
      item.onClick:Set(function()
        FloatTipsUtil.ShowWarnTips(T(1971))
      end)
      ChangeUIController(item, "lock", 1)
    end
    ChangeUIController(item, "c1", fashionId == data.id and 1 or 0)
    if fashionId == data.id then
      tempItem = item
      UIUtil.SetCardShowSpineAutoAlpha(data.id, uis.Main.ClothesSet.Pic.PicLoader, uis.Main.ClothesSet.Pic.PicHolder)
    end
  end
  
  list.numItems = #listFashion
  uis.Main.ClothesSet.CardInfo.CardInfoLookBtn.onClick:Set(function()
    if infoFaceId then
      OpenWindow(WinResConfig.ClothesGetShowWindow.name, nil, {
        {id = infoFaceId}
      })
    end
  end)
  uis.Main.ClothesSet.CardInfo.root.visible = true
end

function WatchWindow.ClearShowInfo()
  infoFaceId = nil
  uis.Main.ClothesSet.CardInfo.root.visible = false
  uis.Main.ClothesSet.Pic.PicLoader.url = ""
  uis.Main.ClothesSet.Pic.PicHolder:SetNativeObject(nil)
end

function WatchWindow.InitBtn()
  jumpTb = CurrencyReturnWindow.SetCurrencyReturn(WinResConfig.WatchWindow.name, uis.Main.CurrencyReturn, FEATURE_ENUM.HOME_LOOK_ROLE, function()
    UIMgr:CloseWindow(WinResConfig.WatchWindow.name)
  end)
  uis.Main.ClothesSet.Set.SortBtn.onClick:Set(function()
    if 0 == uis.Main.ClothesSet.Set.TabList.selectedIndex then
      if nil == sortCardList then
        sortCardList = WatchWindow.GetCardListByTime()
        sortCardList = WatchWindow.SetSelectCardFirst(sortCardList)
        reverseCardList = table.reverseTable(sortCardList)
        reverseCardList = WatchWindow.SetSelectCardFirst(reverseCardList)
      end
      if sortInverted then
        WatchWindow.InitList(reverseCardList, 0)
      else
        WatchWindow.InitList(sortCardList, 0)
      end
    elseif sortInverted then
      local data = WatchWindow.GetAllSpecialFashion()
      WatchWindow.InitList(table.reverseTable(data), 1)
    else
      local data = WatchWindow.GetAllSpecialFashion()
      WatchWindow.InitList(data, 1)
    end
    sortInverted = not sortInverted
  end)
  uis.Main.ClothesSet.Set.PositionBtn.onClick:Set(function()
    if curShowIndex and showId[curShowIndex] then
      UIMgr:SendWindowMessage(WinResConfig.HomeWindow.name, WindowMsgEnum.HomeWindow.SETTING_LOOK_ROLE, {
        id = showId[curShowIndex],
        index = curShowIndex
      })
      UIMgr:CloseToWindow(WinResConfig.HomeWindow.name)
    end
  end)
end

function WatchWindow.OnClose()
  RedDotMgr.RemoveNode(WinResConfig.WatchWindow.name)
  uis = nil
  contentPane = nil
  cardId = nil
  isPlayUp = nil
  sortInverted = nil
  sortCardList = nil
  reverseCardList = nil
  if jumpTb then
    jumpTb.Close()
    jumpTb = nil
  end
  newFashion = nil
  infoFaceId = nil
  lastChoice = nil
  newFashion = nil
  showId = nil
  curListId = nil
end

return WatchWindow
