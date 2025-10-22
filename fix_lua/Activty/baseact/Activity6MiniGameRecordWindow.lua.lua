require("ActivityDungeon1005_MiniIntegralWindowByName")
local Activity6MiniGameRecordWindow = {}
local uis, contentPane
local gameId = 70441007

function Activity6MiniGameRecordWindow.ReInitData()
end

function Activity6MiniGameRecordWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.Activity6MiniGameRecordWindow.package, WinResConfig.Activity6MiniGameRecordWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActivityDungeon1005_MiniIntegralWindowUis(contentPane)
    Activity6MiniGameRecordWindow.UpdateInfo()
    Activity6MiniGameRecordWindow.InitBtn()
  end)
end

function Activity6MiniGameRecordWindow.UpdateInfo()
  local info = Activity6_MiniGameData.GetMiniGameInfo(gameId)
  local records = info.records
  local list = uis.Main.TipsList
  table.sort(records, function(x, y)
    return x.stamp > y.stamp
  end)
  
  function list.itemRenderer(i, gcmp)
    local record = records[i + 1]
    local map = record.counts
    local stamp = record.stamp
    local point = record.point
    local child = gcmp:GetChild("Tips")
    local time = TimeUtil.FormatOfflineTime(LoginData.GetCurServerTime() - stamp)
    UIUtil.SetText(child, time, "TimeTxt")
    local rewardTipsTxt = T(20494, point)
    UIUtil.SetText(child, rewardTipsTxt, "WordTxt")
  end
  
  list.numItems = records and #records or 0
  for i = 0, list.numChildren - 1 do
    local child = list:GetChildAt(i)
    child:GetChild("Tips").alpha = 0
    PlayUITrans(child, "up", nil, i * 0.03)
  end
end

function Activity6MiniGameRecordWindow.InitBtn()
  uis.Main.ReturnBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.Activity6MiniGameRecordWindow.name)
  end)
end

function Activity6MiniGameRecordWindow.OnClose()
  uis = nil
  contentPane = nil
end

return Activity6MiniGameRecordWindow
