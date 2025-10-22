require("ActivityDungeon1006_MiniIntegralWindowByName")
local Activity7MiniGameRecordWindow = {}
local uis, contentPane

function Activity7MiniGameRecordWindow.ReInitData()
end

function Activity7MiniGameRecordWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.Activity7MiniGameRecordWindow.package, WinResConfig.Activity7MiniGameRecordWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActivityDungeon1006_MiniIntegralWindowUis(contentPane)
    Activity7MiniGameRecordWindow.UpdateInfo()
    Activity7MiniGameRecordWindow.InitBtn()
  end)
end

function Activity7MiniGameRecordWindow.UpdateInfo()
  local info = Activity7_MiniGameData.GetMiniGameInfo()
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
    if point and point <= 0 then
      UIUtil.SetText(child, T(1820), "WordTxt")
    else
      UIUtil.SetText(child, T(1783, Activity7MiniGameRecordWindow.GetGameTime(point)), "WordTxt")
    end
  end
  
  list.numItems = records and #records or 0
  for i = 0, list.numChildren - 1 do
    local child = list:GetChildAt(i)
    child:GetChild("Tips").alpha = 0
    PlayUITrans(child, "up", nil, i * 0.03)
  end
end

function Activity7MiniGameRecordWindow.GetGameTime(time)
  if nil == time or time <= 0 then
    return ""
  end
  local t = math.floor(time)
  local minutes = math.floor(t / 60)
  return T(1788, minutes, t % 60)
end

function Activity7MiniGameRecordWindow.InitBtn()
  uis.Main.ReturnBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.Activity7MiniGameRecordWindow.name)
  end)
end

function Activity7MiniGameRecordWindow.OnClose()
  uis = nil
  contentPane = nil
end

return Activity7MiniGameRecordWindow
