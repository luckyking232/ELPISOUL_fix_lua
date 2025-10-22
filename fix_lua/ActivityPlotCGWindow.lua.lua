require("AbyssActivityPlot_ActivityCGWindowByName")
local ActivityPlotCGWindow = {}
local uis, contentPane

function ActivityPlotCGWindow.ReInitData()
end

function ActivityPlotCGWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.ActivityPlotCGWindow.package, WinResConfig.ActivityPlotCGWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetAbyssActivityPlot_ActivityCGWindowUis(contentPane)
    ActivityPlotCGWindow.UpdateInfo()
    ActivityPlotCGWindow.InitBtn()
  end)
end

function ActivityPlotCGWindow.UpdateInfo()
  local cgData = ActivityPlotCGWindow.GetActivityData()
  uis.Main.TipsRegion.Title.NameTxt.text = T(1799)
  local list = uis.Main.TipsRegion.TipsList
  
  function list.itemRenderer(i, item)
    local tips = item:GetChild("CGIconBtn")
    tips:GetChild("PicLoader").url = UIUtil.GetResUrl(cgData[i + 1].icon)
    UIUtil.SetText(tips, cgData[i + 1].name(), "WordTxt")
    tips.onClick:Set(function()
      OpenWindow(WinResConfig.CGShowWindow.name, nil, cgData[i + 1].id)
    end)
    tips.alpha = 0
    PlayUITrans(item, "up", nil, i * 0.05)
  end
  
  list.numItems = #cgData
end

function ActivityPlotCGWindow.GetActivityData()
  local data = TableData.GetTable("BaseActivityStageReview")
  local activityInfo = ActivityPlotData.GetActivityInfo()
  local lock = activityInfo and activityInfo.unlockList and activityInfo.unlockList or {}
  local ids = {}
  for i, v in pairs(data) do
    if table.contain(lock, v.id) and v.cg then
      for index = 1, #v.cg do
        table.insert(ids, v.cg[index])
      end
    end
  end
  local cg = {}
  for i = 1, #ids do
    local data = TableData.GetConfig(ids[i], "BaseStoryCg")
    if data then
      table.insert(cg, data)
    end
  end
  table.sort(cg, function(a, b)
    return a.sort < b.sort
  end)
  return cg
end

function ActivityPlotCGWindow.InitBtn()
  uis.Main.TipsRegion.CloseBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.ActivityPlotCGWindow.name)
  end)
  uis.Main.TouchScreenBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.ActivityPlotCGWindow.name)
  end)
end

function ActivityPlotCGWindow.OnClose()
  uis = nil
  contentPane = nil
end

return ActivityPlotCGWindow
