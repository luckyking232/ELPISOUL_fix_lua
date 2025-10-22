require("AbyssActivityPlot_ActivityPlotShopWindowByName")
local ActivityPlotShopWindow = {}
local uis, contentPane, jumpTb, tempAssetsTips, activityInfo

function ActivityPlotShopWindow.ReInitData()
end

function ActivityPlotShopWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.ActivityPlotShopWindow.package, WinResConfig.ActivityPlotShopWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetAbyssActivityPlot_ActivityPlotShopWindowUis(contentPane)
    uis.Main.BackGround.BackGroundLoader.url = UIUtil.GetBackgroundUrl(FEATURE_ENUM.ABYSS_ACTIVITY_PLOT)
    ActivityPlotShopWindow.UpdateInfo()
    ActivityPlotShopWindow.InitBtn()
  end)
end

function ActivityPlotShopWindow.GetActivityData()
  local data = TableData.GetTable("BaseActivityStageReview")
  local lock = activityInfo and activityInfo.unlockList and activityInfo.unlockList or {}
  local tb = {}
  for i, v in pairs(data) do
    if table.contain(lock, v.id) then
      table.insert(tb, v)
    end
  end
  table.sort(tb, function(a, b)
    return a.sort < b.sort
  end)
  return tb
end

function ActivityPlotShopWindow.UpdateInfo(noPlayAnim)
  local str = TableData.GetConfig(70010826, "BaseFixed").array_value
  local arr = Split(str, "|")
  tempAssetsTips = {}
  for i = 1, #arr do
    table.insert(tempAssetsTips, tonumber(arr[i]))
  end
  UIUtil.InitAssetsTips(uis.Main.AssetsTipsList, tempAssetsTips)
  activityInfo = ActivityPlotData.GetActivityInfo()
  activityInfo = activityInfo or {}
  activityInfo.boughtItem = activityInfo.boughtItem or {}
  local shopListData = ActivityPlotShopWindow.GetActivityData()
  
  function uis.Main.ItemList.itemRenderer(i, item)
    local shopTitle = item:GetChild("ShopTitle")
    ChangeUIController(shopTitle, "c1", i)
    local data = shopListData[i + 1]
    local shopData = TableData.GetConfig(data.shop_id, "BaseActivityShop")
    if shopData and shopData.name then
      UIUtil.SetText(shopTitle, shopData.name(), "NameTxt")
    end
    local list = item:GetChild("ItemList")
    local shopGrid = ActivityPlotShopWindow.GetShopGrid(data.shop_id)
    ActivityPlotShopWindow.ShowItem(list, shopGrid, noPlayAnim)
  end
  
  uis.Main.ItemList.numItems = #shopListData
end

function ActivityPlotShopWindow.ShowItem(list, shopGrid, noPlayAnim)
  function list.itemRenderer(i, item)
    local data = shopGrid[i + 1]
    
    local tokenCom = item:GetChild("Item")
    local itemBtn = tokenCom:GetChild("ItemBtn")
    local itemData, ctrType = ActivityPlotShopWindow.ShowOneReward(data.item[1], itemBtn, "ItemLoader", "NumberTxt", true)
    local have = false
    if itemData then
      local storyList = ActorData.GetStoryList()
      if ActorData.GetItemCount(itemData.id) > 0 or storyList[itemData.id] then
        have = true
      end
      itemBtn:GetChild("NameTxt").text = itemData.name()
      print(itemData.quality, itemData.id, "<<<<<<<<<<<<<")
      ChangeUIController(itemBtn, "c1", itemData.quality)
    end
    if ctrType then
      ChangeUIController(itemBtn, "c3", ctrType)
    end
    if 0 == ctrType then
      local type, detailData = ShopMgr.GetLookDetailsBtn(itemData.id)
      if detailData and #detailData > 0 then
        ChangeUIController(itemBtn:GetChild("UseMark"), "c1", type == USE_TYPE.CARD and 1 or 2)
        ChangeUIController(itemBtn, "c5", 1)
      else
        ChangeUIController(itemBtn, "c5", 0)
      end
    else
      ChangeUIController(itemBtn, "c5", 0)
    end
    ActivityPlotShopWindow.ShowOneReward(data.sell_price[1], itemBtn, "SpendLoader", "Spend")
    local num = have and 0 or data.sell_limit_time
    local bought = activityInfo.boughtItem[data.id] or 0
    if num and num > bought or -1 == num then
      if -1 == num then
        itemBtn:GetChild("ItemNumber"):GetChild("NumberTxt").text = T(1549)
      else
        itemBtn:GetChild("ItemNumber"):GetChild("NumberTxt").text = T(438, num - bought)
      end
      item.onClick:Set(function()
        OpenWindow(WinResConfig.ShopTokensTipsWindow.name, nil, data.id, tempAssetsTips, {
          gridId = data.id,
          boughtNum = bought,
          plot = true
        })
      end)
      ChangeUIController(itemBtn, "c2", 0)
      ChangeUIController(tokenCom, "c1", 0)
    else
      item.onClick:Set(function()
        FloatTipsUtil.ShowWarnTips(have and T(1567) or T(469))
      end)
      UIUtil.SetText(tokenCom:GetChild("SellOut"), have and T(1567) or T(469), "NameTxt")
      ChangeUIController(tokenCom, "c1", 1)
      ChangeUIController(itemBtn, "c2", 1)
    end
    if not noPlayAnim then
      tokenCom.alpha = 0
      PlayUITrans(item, "up", nil, Const.gridSpeed * i)
    end
  end
  
  list.numItems = #shopGrid
  list:ResizeToFit()
end

function ActivityPlotShopWindow.ShowOneReward(reward, item, loaderName, numberTxtName, showStr, smallIcon)
  local config, ctrType
  if item and reward then
    local arr = Split(reward, ":")
    if arr and 3 == #arr then
      local itemType = tonumber(arr[1])
      if itemType == ProtoEnum.TUPLE_TYPE.CARD then
        ctrType = 1
        local loader = item:GetChild("CardHeadBg"):GetChild("PicLoader")
        if loader then
          local data = TableData.GetConfig(tonumber(arr[2]), "BaseCard")
          if data then
            local list = item:GetChild("StarList")
            
            function list.itemRenderer()
            end
            
            list.numItems = data.star
            UIUtil.SetHeadByFaceId(data.fashion_id, loader, HEAD_ICON_TYPE_ENUM.RECT)
            config = {
              quality = data.star - 1,
              name = data.name
            }
          end
        end
      elseif itemType == ProtoEnum.TUPLE_TYPE.BGM then
        ctrType = 0
        local loader = item:GetChild(loaderName)
        if loader then
          config = TableData.GetConfig(tonumber(arr[2]), "BaseSound")
          if config then
            local icon = smallIcon and config.icon_small and config.icon_small or config.icon
            loader.url = UIUtil.GetResUrl(icon)
          end
        end
      else
        ctrType = 0
        local loader = item:GetChild(loaderName)
        if loader then
          config = TableData.GetConfig(tonumber(arr[2]), "BaseItem")
          if config then
            local icon = smallIcon and config.icon_small and config.icon_small or config.icon
            loader.url = UIUtil.GetResUrl(icon)
          end
        end
      end
      local numberTxt = item:GetChild(numberTxtName)
      if numberTxt then
        if showStr then
          ChangeUIController(item, "c4", tonumber(arr[3]) > 1 and 0 or 1)
        end
        numberTxt.text = arr[3]
      end
    end
  end
  return config, ctrType
end

function ActivityPlotShopWindow.GetShopGrid(groupId)
  local data = TableData.GetTable("BaseActivityShopGrid")
  local newTb = {}
  for i, v in pairs(data) do
    if v.activity_shop_id == groupId then
      table.insert(newTb, v)
    end
  end
  table.sort(newTb, function(a, b)
    return a.sort_index < b.sort_index
  end)
  return newTb
end

function ActivityPlotShopWindow.InitBtn()
  jumpTb = CurrencyReturnWindow.SetCurrencyReturn(WinResConfig.ActivityPlotShopWindow.name, uis.Main.CurrencyReturn)
end

function ActivityPlotShopWindow.OnClose()
  uis = nil
  contentPane = nil
  activityInfo = nil
  tempAssetsTips = nil
  if jumpTb then
    jumpTb.Close()
    jumpTb = nil
  end
end

function ActivityPlotShopWindow.HandleMessage(msgId, para)
  if WindowMsgEnum.ActivityPlot.REFRESH_SHOP == msgId then
    ActivityPlotShopWindow.UpdateInfo(true)
  end
end

return ActivityPlotShopWindow
