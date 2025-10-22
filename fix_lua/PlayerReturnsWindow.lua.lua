require("PlayerReturns_PlayerReturnsWindowByName")
local PlayerReturnsWindow = {}
local uis, contentPane, TAB_LOOKUP, RefreshLoginRewardPanel, RefreshSignRewardPanel, RefreshShopPanel

function RefreshLoginRewardPanel()
  RedDotMgr.UpdateNodeByWindowName(WinResConfig.PlayerReturnsWindow.name)
  local activInfo = ActivityReturnData.GetActivityInfo()
  local got = activInfo and activInfo.freeReward > 0
  local panel = uis.Main.LandReward
  local getBtn = panel.root:GetChild("Get")
  ChangeUIController(getBtn, "c1", got and 1 or 0)
  local titleTxt = T(20819)
  local descTxt = T(20805)
  local getTxt = T(20806)
  UIUtil.SetBtnText(getBtn, got and T(1383) or getTxt)
  local config = TableData.GetConfig(activInfo.baseInfo.activityId, "BaseActivityReturn")
  local rewards = config.reward
  local itemlist = panel.ItemList
  panel.TitleTxt.text = titleTxt
  
  function panel.WordList.itemRenderer(i, gcmp)
    UIUtil.SetText(gcmp, descTxt, "WordTxt")
  end
  
  panel.WordList.numItems = 1
  
  function itemlist.itemRenderer(i, gcmp)
    local str = rewards[i + 1]
    local splits = Split(str, ":")
    local itemId, count = tonumber(splits[2]), tonumber(splits[3])
    UIUtil.ShowItemFrame(itemId, gcmp, count, nil, function()
      UIUtil.CommonItemClickCallback(itemId, 1)
    end)
  end
  
  itemlist.numItems = #rewards
  getBtn.onClick:Set(function()
    local info = ActivityReturnData.GetActivityInfo()
    if info and 0 == info.freeReward and not ActivityReturnMgr.Outofdate(true) then
      ActivityReturnService.ActivityReturnSignReq(info.baseInfo.activityId, 0, RefreshLoginRewardPanel)
    end
  end)
end

function RefreshSignRewardPanel()
  RedDotMgr.UpdateNodeByWindowName(WinResConfig.PlayerReturnsWindow.name)
  local activInfo = ActivityReturnData.GetActivityInfo()
  local config = TableData.GetConfig(activInfo.baseInfo.activityId, "BaseActivityReturn")
  local tbl = TableData.GetTable("BaseActivityCheckIn")
  local signRewardConfs = {}
  for i, v in pairs(tbl) do
    if v.type == config.check_in then
      table.insert(signRewardConfs, v)
    end
  end
  table.sort(signRewardConfs, function(x, y)
    return x.day < y.day
  end)
  local panel = uis.Main.SignReward
  local titleTxt = T(20807)
  local descTxt = T(20808)
  panel.WordTxt.text = descTxt
  panel.TitleTxt.text = titleTxt
  local itemlist = panel.ItemList
  
  function itemlist.itemRenderer(i, gcmp)
    local conf = signRewardConfs[i + 1]
    local day = conf.day
    UIUtil.SetText(gcmp, conf.day, "DayTxt")
    local str = conf.reward[1]
    local splits = Split(str, ":")
    local itemId, count = tonumber(splits[2]), tonumber(splits[3])
    local got = day <= activInfo.signDay
    local locked = day - activInfo.returnDay > 0
    ChangeUIController(gcmp, "c1", got and 2 or locked and 0 or 1)
    UIUtil.ShowItemFrame(itemId, gcmp:GetChild("Item"), count, nil, function()
      UIUtil.CommonItemClickCallback(itemId, 1)
    end)
    UIUtil.SetText(gcmp, T(1382), "WordTxt")
    gcmp.onClick:Set(function()
      if not got and not locked and not ActivityReturnMgr.Outofdate(true) then
        ActivityReturnService.ActivityReturnSignReq(activInfo.baseInfo.activityId, 1, RefreshSignRewardPanel)
      end
    end)
  end
  
  itemlist.numItems = #signRewardConfs
end

local onClick_MultipleReward = function()
  local panel = uis.Main.Multiple
  local titleTxt = T(20809)
  local descTxt = T(20810)
  local goTxt = T(20811)
  local activInfo = ActivityReturnData.GetActivityInfo()
  local multiDrops = activInfo.dailyDrop
  panel.WordTxt.text = descTxt
  panel.TitleTxt.text = titleTxt
  local multiDroppedEntries = ActivityReturnMgr.GetMultiDroppedEntries()
  local remainCount = multiDrops[1] and multiDrops[1].count or 0
  local numberTxt = remainCount > 0 and T(20812, remainCount, multiDroppedEntries[1].threshold) or T(20813, remainCount, multiDroppedEntries[1].threshold)
  panel.Number.WordTxt.text = numberTxt
  UIUtil.SetBtnText(panel.GoBtn, goTxt)
  panel.GoBtn.onClick:Set(function()
    if not ActivityReturnMgr.Outofdate(true) then
      local enum = ProtoEnum.SCENE_TYPE
      AdventureService.GetSceneInfoReq({
        enum.DAILY_COIN,
        enum.DAILY_ROLE_EXP,
        enum.DAILY_SKILL_BOOK,
        enum.DAILY_QUALITY_UP,
        enum.DAILY_MATERIAL,
        enum.DAILY_BADGE_EXP
      }, function()
        OpenWindow(WinResConfig.DailyDungeonWindow.name)
      end)
    end
  end)
end
local GetGridEntries = function(groupId)
  local data = TableData.GetTable("BaseActivityShopGrid")
  local grids = {}
  local index = 1
  for _, v in pairs(data) do
    if v.activity_shop_id == groupId then
      local gridItems = grids[index]
      if gridItems and gridItems.items and #gridItems.items >= 4 then
        index = index + 1
      end
      grids[index] = grids[index] or {
        items = {},
        condition = v.unlock_limit or 0
      }
      table.insert(grids[index].items, v)
    end
  end
  local comp = function(a, b)
    return a.sort_index < b.sort_index
  end
  for _, v in pairs(grids) do
    table.sort(v, comp)
  end
  return grids
end
local DisplayItem = function(reward, item, loaderName, numberTxtName, showStr, smallIcon)
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
local DisplayItems = function(list, shopGrid, dont_play_anim)
  function list.itemRenderer(i, gcmp)
    local data = shopGrid[i + 1]
    
    local itemBtn = gcmp:GetChild("Item")
    local itemData, ctrType = DisplayItem(data.item[1], itemBtn, "ItemLoader", "NumberTxt", true)
    if itemData then
      UIUtil.SetText(gcmp:GetChild("MoveWord"), itemData.name(), "WordTxt")
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
    local buyBtn = gcmp:GetChild("BuyBtn")
    local str = data.sell_price[1]
    DisplayItem(str, buyBtn, "PicLoader", "NumberTxt")
    local numberTxt = buyBtn:GetChild("NumberTxt")
    local splits = Split(str, ":")
    local costId, costCount = tonumber(splits[2]), tonumber(splits[3])
    numberTxt.text = -costCount
    local enough = costCount <= ActorData.GetItemCount(costId)
    ChangeUIController(buyBtn, "c1", enough and 0 or 1)
    local num = data.sell_limit_time
    local activInfo = ActivityReturnData.GetActivityInfo()
    local bought = activInfo.boughtItem[data.id] or 0
    if num and num > bought or -1 == num then
      if -1 == num then
        gcmp:GetChild("NumberTxt").text = T(1549)
      else
        gcmp:GetChild("NumberTxt").text = T(438, num - bought)
      end
      buyBtn.onClick:Set(function()
        if not ActivityReturnMgr.Outofdate(true) then
          OpenWindow(WinResConfig.ShopTokensTipsWindow.name, nil, data.id, {21000038}, {
            activityId = activInfo.baseInfo.activityId,
            gridId = data.id,
            boughtNum = bought,
            playerReturns = true,
            callback = RefreshShopPanel
          })
        end
      end)
      ChangeUIController(itemBtn, "c2", 0)
      ChangeUIController(gcmp, "c1", 0)
    else
      buyBtn.onClick:Set(function()
        FloatTipsUtil.ShowWarnTips(T(481))
      end)
      UIUtil.SetText(gcmp:GetChild("SellOut"), T(469), "NameTxt")
      ChangeUIController(gcmp, "c1", 1)
      ChangeUIController(itemBtn, "c2", 1)
    end
  end
  
  list.numItems = #shopGrid
  list:ResizeToFit()
end

function RefreshShopPanel(dont_play_anim)
  RedDotMgr.UpdateNodeByWindowName(WinResConfig.PlayerReturnsWindow.name)
  local panel = uis.Main.Shop
  local rootlist = panel.ItemRegionList
  local activInfo = ActivityReturnData.GetActivityInfo()
  local config = TableData.GetConfig(activInfo.baseInfo.activityId, "BaseActivityReturn")
  local shopId = config.shop_id
  local gridEntries = GetGridEntries(shopId)
  local numberTxt = ""
  local wordTxt = T(20814)
  local taskId = config.task_id
  local taskConf = TableData.GetConfig(taskId, "BaseTask")
  local taskInfo = activInfo.taskList[1]
  local threshold = taskConf.task_parameter[1]
  local barValue = math.min(taskInfo.value, threshold)
  local reward = taskConf.reward
  local progressTxt = string.format("[color=#ffcc00]%s[/color]/%s", barValue, threshold)
  panel.TokenRegion.TokenProgressBar.value = 100 * barValue / threshold
  local rewardStr = reward[1]
  local splits = Split(rewardStr, ":")
  UIUtil.SetIconById(panel.TokenRegion.PicLoader, tonumber(splits[2]))
  numberTxt = splits[3]
  panel.TokenRegion.NumberTxt.text = numberTxt
  panel.TokenRegion.WordTxt.text = wordTxt
  if taskInfo.state == ProtoEnum.TASK_STATE.FINISHED then
    panel.TokenRegion.PicLoader.onClick:Set(function()
      if not ActivityReturnMgr.Outofdate(true) then
        ActivityReturnService.ActivityReturnTaskRewardReq(activInfo.baseInfo.activityId, taskInfo.uid, RefreshShopPanel)
      end
    end)
    panel.TokenRegion.c1Ctr.selectedIndex = 1
  elseif taskInfo.state == ProtoEnum.TASK_STATE.NORMAL then
    panel.TokenRegion.c1Ctr.selectedIndex = 0
  elseif taskInfo.state == ProtoEnum.TASK_STATE.REWARD then
    panel.TokenRegion.c1Ctr.selectedIndex = 2
  end
  panel.TokenRegion.ProgressTxt.text = progressTxt
  local getBtnTitle = taskInfo.state == ProtoEnum.TASK_STATE.FINISHED and T(20872) or T(20887)
  UIUtil.SetText(panel.GetBtn, getBtnTitle, "WordTxt")
  panel.GetBtn.onClick:Set(function()
    if ActivityReturnMgr.Outofdate(true) then
      return
    end
    if taskInfo.state == ProtoEnum.TASK_STATE.FINISHED then
      ActivityReturnService.ActivityReturnTaskRewardReq(activInfo.baseInfo.activityId, taskInfo.uid, RefreshShopPanel)
    elseif taskInfo.state == ProtoEnum.TASK_STATE.NORMAL then
      FloatTipsUtil.ShowWarnTips(T(20873))
    elseif taskInfo.state == ProtoEnum.TASK_STATE.REWARD then
      FloatTipsUtil.ShowWarnTips(T(20874))
    end
  end)
  panel.GetBtn.visible = taskInfo.state ~= ProtoEnum.TASK_STATE.REWARD
  
  function rootlist.itemRenderer(i, gcmp)
    local entry = gridEntries[i + 1]
    local list = gcmp:GetChild("ItemList")
    local locked = activInfo.costItemCount < entry.condition
    local consumeTxt = T(20820, entry.condition or 0)
    local progressTxt = string.format("(%s/%s)", activInfo.costItemCount, entry.condition or 0)
    local lock = gcmp:GetChild("ItemLock")
    ChangeUIController(gcmp, "c1", locked and 1 or 0)
    local lockWord = lock:GetChild("LockWord")
    UIUtil.SetText(lockWord, consumeTxt, "WordTxt")
    UIUtil.SetText(lockWord, progressTxt, "NumberTxt")
    DisplayItems(list, entry.items, not dont_play_anim)
  end
  
  rootlist.numItems = #gridEntries
  local costId = 21000038
  UIUtil.InitAssetsTips(uis.Main.AssetsTipsList, {costId})
end

TAB_LOOKUP = {
  [1] = {
    title = T(20821),
    onClick = RefreshLoginRewardPanel
  },
  [2] = {
    title = T(20822),
    onClick = RefreshSignRewardPanel
  },
  [3] = {
    title = T(20823),
    onClick = onClick_MultipleReward
  },
  [4] = {
    title = T(20824),
    onClick = RefreshShopPanel
  }
}
local RefreshRemainTime = function()
  local activInfo = ActivityReturnData.GetActivityInfo()
  local diff = activInfo.baseInfo.endStamp - LoginData.GetCurServerTime()
  uis.Main.TabRegion.TabTime.TimeTxt.text = T(20825, TimeUtil.FormatTime(math.max(0, diff)))
end

function PlayerReturnsWindow.ReInitData()
end

local fromPopup

function PlayerReturnsWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.PlayerReturnsWindow.package, WinResConfig.PlayerReturnsWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    fromPopup = bridgeObj.argTable[1]
    uis = GetPlayerReturns_PlayerReturnsWindowUis(contentPane)
    PlayerReturnsWindow.UpdateInfo()
    PlayerReturnsWindow.InitBtn()
  end)
end

local timer

function PlayerReturnsWindow.UpdateInfo()
  uis.Main.BackGround.BackGroundLoader.url = "ui://UIBackGround/PlayerReturns_1000"
  CurrencyReturnWindow.SetCurrencyReturn(WinResConfig.PlayerReturnsWindow.name, uis.Main.CurrencyReturn)
  local tablist = uis.Main.TabRegion.TabList
  
  function tablist.itemRenderer(i, gcmp)
    local item = TAB_LOOKUP[i + 1]
    UIUtil.SetText(gcmp, item.title, "NameTxt")
    gcmp.onClick:Set(function()
      if tablist.selectedIndex ~= i then
        tablist.selectedIndex = i
        uis.Main.c1Ctr.selectedIndex = i
        item.onClick()
      end
    end)
  end
  
  ActivityReturnService.GetAllActivitiesReq(function()
    tablist.numItems = #TAB_LOOKUP
    RedDotMgr.AddNode({
      windowName = WinResConfig.PlayerReturnsWindow.name,
      com = tablist:GetChildAt(0),
      visibleFunc = function()
        return RedDotPlayerReturn.HasAnyLoginReward()
      end,
      dataType = RED_DOT_DATA_TYPE.ACTIVITY_PLAYER_RETURN
    })
    RedDotMgr.AddNode({
      windowName = WinResConfig.PlayerReturnsWindow.name,
      com = tablist:GetChildAt(1),
      visibleFunc = function()
        return RedDotPlayerReturn.HasAnySignReward()
      end,
      dataType = RED_DOT_DATA_TYPE.ACTIVITY_PLAYER_RETURN
    })
    RedDotMgr.AddNode({
      windowName = WinResConfig.PlayerReturnsWindow.name,
      com = tablist:GetChildAt(2),
      visibleFunc = function()
        return RedDotPlayerReturn.HasMultiDroppedCount()
      end,
      dataType = RED_DOT_DATA_TYPE.ACTIVITY_PLAYER_RETURN
    })
    RedDotMgr.AddNode({
      windowName = WinResConfig.PlayerReturnsWindow.name,
      com = tablist:GetChildAt(3),
      visibleFunc = function()
        return RedDotPlayerReturn.HasAnyTaskReward()
      end,
      dataType = RED_DOT_DATA_TYPE.ACTIVITY_PLAYER_RETURN
    })
    RedDotMgr.AddNode({
      windowName = WinResConfig.PlayerReturnsWindow.name,
      com = uis.Main.Shop.GetBtn,
      visibleFunc = function()
        return RedDotPlayerReturn.HasAnyTaskReward()
      end,
      dataType = RED_DOT_DATA_TYPE.ACTIVITY_PLAYER_RETURN
    })
    local defaultIndex = 0
    tablist.selectedIndex = defaultIndex
    TAB_LOOKUP[defaultIndex + 1].onClick()
    RefreshRemainTime()
    timer = TimerUtil.setInterval(1, -1, RefreshRemainTime)
  end)
end

function PlayerReturnsWindow.InitBtn()
end

function PlayerReturnsWindow.OnClose()
  RedDotMgr.RemoveNode(WinResConfig.PlayerReturnsWindow.name)
  uis = nil
  contentPane = nil
  if timer then
    timer:stop()
  end
  timer = nil
  if fromPopup then
    local key = PLAYER_PREF_ENUM.ACTIVITY_PLAYER_RETURN_POPUP
    FunctionQueueUtil.SetFunEnd(key)
  end
end

function PlayerReturnsWindow.HandleMessage(msgId, para)
  if msgId == WindowMsgEnum.Common.E_MSG_CROSS_DAY then
    ActivityReturnService.GetAllActivitiesReq(function()
      local tablist = uis.Main.TabRegion.TabList
      local index = tablist.selectedIndex + 1
      if index > 0 and index <= #TAB_LOOKUP then
        TAB_LOOKUP[index].onClick()
      end
    end)
  end
end

return PlayerReturnsWindow
