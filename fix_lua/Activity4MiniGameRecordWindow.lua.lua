require("ActivityDungeon1003_MiniIntegralWindowByName")
local Activity4MiniGameRecordWindow = {}
local uis, contentPane

function Activity4MiniGameRecordWindow.ReInitData()
end

function Activity4MiniGameRecordWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.Activity4MiniGameRecordWindow.package, WinResConfig.Activity4MiniGameRecordWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActivityDungeon1003_MiniIntegralWindowUis(contentPane)
    Activity4MiniGameRecordWindow.UpdateInfo()
    Activity4MiniGameRecordWindow.InitBtn()
  end)
end

function Activity4MiniGameRecordWindow.UpdateInfo()
  local info = Activity4_MiniGameData.GetMiniGameInfo()
  local records = info.records
  local list = uis.Main.TipsList
  table.sort(records, function(x, y)
    return x.stamp > y.stamp
  end)
  
  function list.itemRenderer(i, gcmp)
    local record = records[i + 1]
    local stamp = record.stamp
    local point = record.point
    local child = gcmp:GetChild("Tips")
    local time = TimeUtil.FormatOfflineTime(LoginData.GetCurServerTime() - stamp)
    UIUtil.SetText(child, time, "TimeTxt")
    UIUtil.SetText(child, T(1691), "WordTxt")
  end
  
  list.numItems = records and #records or 0
  for i = 0, list.numChildren - 1 do
    local child = list:GetChildAt(i)
    child:GetChild("Tips").alpha = 0
    PlayUITrans(child, "up", nil, i * 0.03)
  end
end

function Activity4MiniGameRecordWindow.InitBtn()
  uis.Main.ReturnBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.Activity4MiniGameRecordWindow.name)
  end)
end

function Activity4MiniGameRecordWindow.OnClose()
  uis = nil
  contentPane = nil
end

return Activity4MiniGameRecordWindow
