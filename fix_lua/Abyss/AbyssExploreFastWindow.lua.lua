require("Abyss_ExploreFastWindowByName")
local AbyssExploreFastWindow = {}
local uis, contentPane, goods, choiceInfo, priceInfo, priceConf, numMax, allSellPrice, canSell
local transPlay = {}
local transItem = {}

function AbyssExploreFastWindow.ReInitData()
end

function AbyssExploreFastWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.AbyssExploreFastWindow.package, WinResConfig.AbyssExploreFastWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetAbyss_ExploreFastWindowUis(contentPane)
    AbyssExploreFastWindow.UpdateInfo()
    AbyssExploreFastWindow.InitBtn()
  end)
end

function AbyssExploreFastWindow.SaveChoiceInfo()
  local str = Json.encode(choiceInfo)
  PlayerPrefsUtil.SetString(PLAYER_PREF_ENUM.SEAl_SHOP_COUNT, str)
end

local GetAssetListByShopType = function(shopType)
  local shopTbl = TableData.GetTable("BaseShop")
  local shopConf
  for i, v in pairs(shopTbl) do
    if v.type == shopType then
      shopConf = v
      break
    end
  end
  return shopConf.bar_res
end

function AbyssExploreFastWindow.UpdateInfo()
  canSell = nil
  transPlay = {}
  transItem = {}
  local shopInfo = ShopData.shopInfo[5]
  if shopInfo then
    goods = shopInfo.goods
    table.sort(goods, function(x, y)
      local sortx = TableData.GetConfig(x.gridId, "BaseShopGrid").sort_index or 0
      local sorty = TableData.GetConfig(y.gridId, "BaseShopGrid").sort_index or 0
      return sortx > sorty
    end)
    local str = PlayerPrefsUtil.GetString(PLAYER_PREF_ENUM.SEAl_SHOP_COUNT)
    if "" == str then
      choiceInfo = {}
    else
      choiceInfo = Json.decode(str)
    end
    for i = 1, #choiceInfo do
      transPlay[choiceInfo[i].id] = true
    end
    priceInfo = {}
    numMax = {}
    local tips = uis.Main.Tips
    tips.Item1List.itemRenderer = AbyssExploreFastWindow.ShopItemRenderer
    tips.Item1List.numItems = #goods
  end
  local res = GetAssetListByShopType(5)
  UIUtil.InitAssetsTips(uis.Main.AssetsList, res)
  AbyssExploreFastWindow.UpdateList()
end

local SetupItem = function(item_cmp, loader_name, url, txt_name, txt_content)
  if item_cmp then
    local loader = item_cmp:GetChild(loader_name)
    if loader then
      loader.url = url
    end
    local txt = item_cmp:GetChild(txt_name)
    if txt then
      txt.text = txt_content
    end
  end
end
local SetupItemWithItemStr = function(item_str, item_cmp, loader_name, number_txt_name, display_str)
  local conf, cnt
  if item_cmp and item_str then
    if type(item_str) == "string" then
      local splits = Split(item_str, ":")
      conf = TableData.GetConfig(tonumber(splits[2]), "BaseItem")
      cnt = tonumber(splits[3])
    else
      conf = TableData.GetConfig(tonumber(item_str[2]), "BaseItem")
      cnt = tonumber(item_str[3])
    end
    SetupItem(item_cmp, loader_name, UIUtil.GetResUrl(conf.icon), number_txt_name, display_str and T(441, cnt) or cnt)
  end
  return conf, cnt
end

function AbyssExploreFastWindow.ShopItemRenderer(i, subItem)
  local goodsData = goods[i + 1]
  local goodsConf = TableData.GetConfig(goodsData.goodsId, "BaseShopPool")
  local splits = Split(goodsConf.item, ":")
  local itemConf, cnt = SetupItemWithItemStr(splits, subItem, "PicLoader", "")
  local gridConf = TableData.GetConfig(goodsData.gridId, "BaseShopGrid")
  if itemConf and gridConf then
    local sellConf, sellNum = SetupItemWithItemStr(goodsConf.sell_price, subItem:GetChild("Spend"), "PicLoader", "NumberTxt")
    priceConf = sellConf
    priceInfo[goodsData.goodsId] = sellNum
    local nameTxt = subItem:GetChild("NameTxt")
    if nameTxt then
      nameTxt.text = itemConf.name()
    end
    local sealConf = TableData.GetConfig(itemConf.id, "BaseSeal")
    if sealConf and sealConf.level then
      UIUtil.SetText(subItem, T(1303, sealConf.level), "LevelTxt")
    end
    local surplusTxt = subItem:GetChild("SurplusTxt")
    local limit_bought_num = gridConf.sell_limit_time
    local sellout = (not limit_bought_num or not (limit_bought_num > goodsData.boughtNum)) and -1 ~= limit_bought_num
    local choiceBtn = subItem:GetChild("ChoiceBtn")
    if sellout then
      ChangeUIController(subItem, "c1", 2)
      UIUtil.SetText(subItem, T(1965), "WordTxt")
      choiceBtn.onClick:Clear()
      AbyssExploreFastWindow.SetNum(goodsData.goodsId, 0, false)
    else
      canSell = true
      local maxValue = limit_bought_num - goodsData.boughtNum
      local numberStrip = subItem:GetChild("NumberStrip")
      local addBtn = numberStrip:GetChild("AddBtn")
      local reduceBtn = numberStrip:GetChild("ReduceBtn")
      local choiceNumberTxt = numberStrip:GetChild("ChoiceNumberTxt")
      local buyNum = maxValue
      local choiceNum = AbyssExploreFastWindow.GetNum(goodsData.goodsId)
      if choiceNum then
        buyNum = math.min(choiceNum, maxValue)
        choiceBtn.selected = true
      else
        choiceBtn.selected = false
      end
      UIUtil.SetText(subItem:GetChild("Spend"), priceInfo[goodsData.goodsId] * buyNum, "NumberTxt")
      numMax[goodsData.goodsId] = maxValue
      local UpdateBuyNum = function()
        choiceNumberTxt.text = T(1966, buyNum, maxValue)
        AbyssExploreFastWindow.SetNum(goodsData.goodsId, buyNum, choiceBtn.selected)
        AbyssExploreFastWindow.SaveChoiceInfo()
        AbyssExploreFastWindow.UpdateList()
        ChangeUIController(addBtn, "c1", buyNum == maxValue and 1 or 0)
        ChangeUIController(reduceBtn, "c1", 1 == buyNum and 1 or 0)
      end
      choiceNumberTxt.text = T(1966, buyNum, maxValue)
      ChangeUIController(addBtn, "c1", buyNum == maxValue and 1 or 0)
      ChangeUIController(reduceBtn, "c1", 1 == buyNum and 1 or 0)
      addBtn.onClick:Set(function()
        buyNum = math.min(buyNum + 1, maxValue)
        UIUtil.SetText(subItem:GetChild("Spend"), priceInfo[goodsData.goodsId] * buyNum, "NumberTxt")
        UpdateBuyNum()
      end)
      reduceBtn.onClick:Set(function()
        buyNum = math.max(buyNum - 1, 1)
        UIUtil.SetText(subItem:GetChild("Spend"), priceInfo[goodsData.goodsId] * buyNum, "NumberTxt")
        UpdateBuyNum()
      end)
      local spNum = 1
      local longSpeed = 1
      local gesture = AbyssExploreFastWindow.GetGesture(addBtn)
      gesture.onAction:Set(function()
        if spNum > 5 then
          longSpeed = longSpeed + 1
          spNum = 1
        end
        buyNum = math.min(buyNum + longSpeed, maxValue)
        UpdateBuyNum()
        spNum = spNum + 1
      end)
      gesture.onBegin:Set(function()
        longSpeed = 1
        spNum = 1
      end)
      gesture.onEnd:Set(function()
        longSpeed = 1
        spNum = 1
      end)
      local gestureReduce = AbyssExploreFastWindow.GetGesture(reduceBtn)
      gestureReduce.onAction:Set(function()
        if spNum > 5 then
          longSpeed = longSpeed + 1
          spNum = 1
        end
        buyNum = math.max(buyNum - longSpeed, 1)
        UpdateBuyNum()
        spNum = spNum + 1
      end)
      gestureReduce.onBegin:Set(function()
        longSpeed = 1
        spNum = 1
      end)
      gestureReduce.onEnd:Set(function()
        longSpeed = 1
        spNum = 1
      end)
      ChangeUIController(subItem, "c1", choiceBtn.selected and 1 or 0)
      choiceBtn.onClick:Set(function()
        ChangeUIController(subItem, "c1", choiceBtn.selected and 1 or 0)
        if transItem[goodsData.goodsId] and choiceBtn.selected == false then
          uis.Main.Tips.root.touchable = false
          PlayUITrans(transItem[goodsData.goodsId], "out1", function()
            uis.Main.Tips.root.touchable = true
            local item = uis.Main.Tips.Item2List:RemoveChild(transItem[goodsData.goodsId])
            item:Dispose()
            transItem[goodsData.goodsId] = nil
            UpdateBuyNum()
          end)
        else
          transPlay[goodsData.goodsId] = true
          UpdateBuyNum()
        end
        UIUtil.SetText(subItem:GetChild("Spend"), priceInfo[goodsData.goodsId] * buyNum, "NumberTxt")
      end)
    end
  end
end

function AbyssExploreFastWindow.UpdateList()
  local tips = uis.Main.Tips
  allSellPrice = 0
  transItem = {}
  
  function tips.Item2List.itemRenderer(i, gCom)
    local item = gCom:GetChild("Item")
    local info = choiceInfo[i + 1]
    transItem[info.id] = gCom
    local goodsConf = TableData.GetConfig(info.id, "BaseShopPool")
    local splits = Split(goodsConf.item, ":")
    SetupItemWithItemStr(splits, item, "PicLoader", "")
    if priceInfo[info.id] and numMax[info.id] then
      local tempNum = math.min(info.num, numMax[info.id])
      UIUtil.SetText(item, tempNum, "NumberTxt")
      allSellPrice = allSellPrice + tempNum * priceInfo[info.id]
    end
    if transPlay[info.id] then
      item.alpha = 0
      transPlay[info.id] = false
      PlayUITrans(gCom, "in1", nil, i * 0.05)
    end
  end
  
  tips.Item2List.numItems = #choiceInfo
  if allSellPrice > 0 then
    tips.Spend.PicLoader.url = UIUtil.GetResUrl(priceConf.icon)
    tips.Spend.WordTxt.text = T(1967)
    if allSellPrice and priceConf and allSellPrice > ActorData.GetItemCount(priceConf.id) then
      tips.Spend.NumberTxt.text = T(1968, allSellPrice)
    else
      tips.Spend.NumberTxt.text = allSellPrice
    end
    ChangeController(tips.c1Ctr, 1)
  else
    ChangeController(tips.c1Ctr, 0)
  end
end

function AbyssExploreFastWindow.GetNum(gridId)
  for i = 1, #choiceInfo do
    if choiceInfo[i].id == gridId then
      return choiceInfo[i].num
    end
  end
end

function AbyssExploreFastWindow.SetNum(gridId, num, addBol)
  for i = 1, #choiceInfo do
    if choiceInfo[i].id == gridId then
      if addBol then
        choiceInfo[i].num = num
      else
        table.remove(choiceInfo, i)
      end
      return
    end
  end
  if addBol then
    table.insert(choiceInfo, {id = gridId, num = num})
  end
end

function AbyssExploreFastWindow.GetGesture(btn)
  local gesture = LongPressGesture.GetLongPressGesture(btn)
  gesture.trigger = 0.5
  gesture.interval = 0.2
  return gesture
end

function AbyssExploreFastWindow.GetGridId(goodsId)
  for i = 1, #goods do
    if goods[i].goodsId == goodsId then
      return goods[i].gridId
    end
  end
end

function AbyssExploreFastWindow.InitBtn()
  uis.Main.TouchScreenBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.AbyssExploreFastWindow.name)
  end)
  uis.Main.Tips.CloseBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.AbyssExploreFastWindow.name)
  end)
  uis.Main.Tips.TitleTxt.text = T(1957)
  UIUtil.SetText(uis.Main.Tips.BuyBtn, T(1962), "NameTxt")
  uis.Main.Tips.BuyBtn.onClick:Set(function()
    if allSellPrice and priceConf and allSellPrice > ActorData.GetItemCount(priceConf.id) then
      FloatTipsUtil.ShowWarnTips(T(81, priceConf.name()))
      return
    end
    local bought = {}
    for i = 1, #choiceInfo do
      local gridId = AbyssExploreFastWindow.GetGridId(choiceInfo[i].id)
      if gridId and numMax[choiceInfo[i].id] then
        table.insert(bought, {
          gridId = gridId,
          num = math.min(choiceInfo[i].num, numMax[choiceInfo[i].id])
        })
      end
    end
    if #bought > 0 then
      ShopService.BuySealShopGoodsReq(bought, function()
        if uis then
          AbyssExploreFastWindow.UpdateInfo()
          if nil == canSell then
            UIMgr:CloseWindow(WinResConfig.AbyssExploreFastWindow.name)
          end
        end
      end)
    else
      FloatTipsUtil.ShowWarnTips(T(1997))
    end
  end)
end

function AbyssExploreFastWindow.OnClose()
  uis = nil
  contentPane = nil
  goods = nil
  choiceInfo = nil
  priceInfo = nil
  priceConf = nil
  numMax = nil
  transPlay = nil
  transItem = nil
end

return AbyssExploreFastWindow
