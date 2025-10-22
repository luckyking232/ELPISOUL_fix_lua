require("ActivityDungeon1008_MiniIntegralWindowByName")
local Activity9MiniGameRecordWindow = {}
local uis, contentPane

function Activity9MiniGameRecordWindow.ReInitData()
end

function Activity9MiniGameRecordWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.Activity9MiniGameRecordWindow.package, WinResConfig.Activity9MiniGameRecordWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActivityDungeon1008_MiniIntegralWindowUis(contentPane)
    Activity9MiniGameRecordWindow.UpdateInfo()
    Activity9MiniGameRecordWindow.InitBtn()
  end)
end

function Activity9MiniGameRecordWindow.UpdateInfo()
  local info = Activity9_MiniGameData.GetOneMiniGameInfo()
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
    if point > 0 then
      UIUtil.SetText(child, T(1871, point), "WordTxt")
    else
      UIUtil.SetText(child, T(1873), "WordTxt")
    end
  end
  
  list.numItems = records and #records or 0
  for i = 0, list.numChildren - 1 do
    local child = list:GetChildAt(i)
    child:GetChild("Tips").alpha = 0
    PlayUITrans(child, "up", nil, i * 0.03)
  end
end

function Activity9MiniGameRecordWindow.GetGameTime(time)
  if nil == time or time <= 0 then
    return ""
  end
  local t = math.floor(time)
  local minutes = math.floor(t / 60)
  return T(1788, minutes, t % 60)
end

function Activity9MiniGameRecordWindow.InitBtn()
  uis.Main.ReturnBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.Activity9MiniGameRecordWindow.name)
  end)
end

function Activity9MiniGameRecordWindow.OnClose()
  uis = nil
  contentPane = nil
end

return Activity9MiniGameRecordWindow
