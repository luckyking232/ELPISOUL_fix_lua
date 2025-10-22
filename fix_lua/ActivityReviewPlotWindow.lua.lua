require("AbyssActivityPlot_ActivityPlotWindowByName")
local ActivityReviewPlotWindow = {}
local uis, contentPane, jumpTb, activityNum

function ActivityReviewPlotWindow.ReInitData()
end

function ActivityReviewPlotWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.ActivityReviewPlotWindow.package, WinResConfig.ActivityReviewPlotWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetAbyssActivityPlot_ActivityPlotWindowUis(contentPane)
    uis.Main.BackGround.BackGroundLoader.url = UIUtil.GetBackgroundUrl(FEATURE_ENUM.ABYSS_ACTIVITY_PLOT)
    ActivityReviewPlotWindow.UpdateInfo()
    ActivityReviewPlotWindow.InitBtn()
    SoundUtil.PlayMusic(30007)
  end)
end

function ActivityReviewPlotWindow.UpdateInfo(notPlayAnim)
  local list = uis.Main.TipsList
  local listData = ActivityReviewPlotWindow.GetActivityData()
  local len = #listData
  activityNum = len
  local info = ActivityPlotData.GetActivityInfo()
  local lockList = info and info.unlockList and info.unlockList or {}
  
  function list.itemRenderer(i, item)
    local tips
    local data = listData[i + 1]
    if data then
      tips = item:GetChild("Tips")
      tips:GetChild("PicLoader").url = UIUtil.GetResUrl(data.icon)
      UIUtil.SetText(tips:GetChild("Time"), data.des_date(), "TimeTxt")
      local lockCom = tips:GetChild("Lock")
      UIUtil.SetText(lockCom, T(1796), "WordTxt")
      local arr = GetConfigItemList(data.cost, true)
      if arr[1] then
        UIUtil.SetText(lockCom, "x" .. arr[1].value, "NumberTxt")
        UIUtil.SetIconById(lockCom:GetChild("PicLoader"), arr[1].id)
      end
      ChangeUIController(tips, "lcok", table.contain(lockList, data.id) and 0 or 1)
      tips.onClick:Set(function()
        if table.contain(lockList, data.id) then
          ActivityDungeonMgr.OpenActivityPlotWindow(data.show_id)
        else
          MessageBox.Show(T(1800), {
            touchCallback = function()
              if ActorData.GetItemCount(arr[1].id) >= arr[1].value then
                ActivityPlotService.ActivityReviewUnlockReq(data.id, function()
                  if uis then
                    ActivityReviewPlotWindow.UpdateInfo(true)
                  end
                end)
              else
                local itemData = TableData.GetConfig(arr[1].id, "BaseItem")
                if itemData then
                  FloatTipsUtil.ShowWarnTips(T(230, itemData.name()))
                end
              end
            end
          }, {})
        end
      end)
      ChangeUIController(item, "c1", 0)
    else
      tips = item:GetChild("Tips1")
      UIUtil.SetText(tips, T(1795), "WordTxt")
      ChangeUIController(item, "c1", 1)
    end
    if not notPlayAnim and i < 7 then
      tips.alpha = 0
      PlayUITrans(item, "up", nil, i * 0.05)
    end
  end
  
  list.numItems = len + 1
  ActivityReviewPlotWindow.AssetsTipsList()
end

function ActivityReviewPlotWindow.AssetsTipsList()
  local str = TableData.GetConfig(70010825, "BaseFixed").array_value
  local arr = Split(str, "|")
  local list = uis.Main.AssetsTipsList
  if list.numChildren > 0 then
    list:RemoveChildren(0, -1, true)
  end
  for i = 1, #arr do
    local itemId = tonumber(arr[i])
    if itemId then
      local item = UIMgr:CreateObject("AbyssActivityPlot", "ActivityPlotAssets")
      local count = ActorData.GetItemCount(itemId)
      UIUtil.SetIconById(item:GetChild("IconLoader"), itemId, true)
      UIUtil.SetText(item, UIUtil.GetFormatCount(count), "NumberTxt")
      list:AddChild(item)
      local config = TableData.GetConfig(itemId, "BaseItem")
      if config and config.go_to_id then
        local goToData = TableData.GetConfig(config.go_to_id[1], "BaseClientGoTo")
        if goToData then
          local featureData = TableData.GetConfig(goToData.go_to_feature, "BaseFeature")
          if featureData then
            CurrencyReturnWindow.SetJumpFun(item, featureData, goToData, false)
          end
        end
      end
    end
  end
  local item = UIMgr:CreateObject("AbyssActivityPlot", "ActivityPlotAssets1")
  UIUtil.SetText(item, T(1797), "WordTxt")
  local info = ActivityPlotData.GetActivityInfo()
  local lockList = info and info.unlockList and info.unlockList or {}
  UIUtil.SetText(item, T(1798, table.getLen(lockList), activityNum), "NumberTxt")
  list:AddChild(item)
end

function ActivityReviewPlotWindow.GetActivityData()
  local data = TableData.GetTable("BaseActivityStageReview")
  local tb = {}
  for i, v in pairs(data) do
    table.insert(tb, v)
  end
  local info = ActivityPlotData.GetActivityInfo()
  local lock = info and info.unlockList and info.unlockList or {}
  local teamA, teamB
  table.sort(tb, function(a, b)
    teamA = table.contain(lock, a.id)
    teamB = table.contain(lock, b.id)
    if teamA and not teamB then
      return true
    elseif not teamA and teamB then
      return false
    end
    return a.sort < b.sort
  end)
  return tb
end

function ActivityReviewPlotWindow.InitBtn()
  jumpTb = CurrencyReturnWindow.SetCurrencyReturn(WinResConfig.ActivityReviewPlotWindow.name, uis.Main.CurrencyReturn, FEATURE_ENUM.ABYSS_ACTIVITY_PLOT)
  UIUtil.SetText(uis.Main.ShopBtn, T(1793))
  uis.Main.ShopBtn.onClick:Set(function()
    local info = ActivityPlotData.GetActivityInfo()
    if info and info.unlockList and table.getLen(info.unlockList) > 0 then
      OpenWindow(WinResConfig.ActivityPlotShopWindow.name)
    else
      FloatTipsUtil.ShowWarnTips(T(1802))
    end
  end)
  UIUtil.SetText(uis.Main.CGBtn, T(1794))
  uis.Main.CGBtn.onClick:Set(function()
    local info = ActivityPlotData.GetActivityInfo()
    if info and info.unlockList and table.getLen(info.unlockList) > 0 then
      OpenWindow(WinResConfig.ActivityPlotCGWindow.name)
    else
      FloatTipsUtil.ShowWarnTips(T(1802))
    end
  end)
end

function ActivityReviewPlotWindow.OnClose()
  uis = nil
  contentPane = nil
  if jumpTb then
    jumpTb.Close()
    jumpTb = nil
  end
end

return ActivityReviewPlotWindow
