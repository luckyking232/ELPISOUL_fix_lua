require("ActivityDungeon1004_MiniIntegralWindowByName")
local Activity5MiniGameRecordWindow = {}
local uis, contentPane
local gameId = 70441005

function Activity5MiniGameRecordWindow.ReInitData()
end

function Activity5MiniGameRecordWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.Activity5MiniGameRecordWindow.package, WinResConfig.Activity5MiniGameRecordWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActivityDungeon1004_MiniIntegralWindowUis(contentPane)
    Activity5MiniGameRecordWindow.UpdateInfo()
    Activity5MiniGameRecordWindow.InitBtn()
  end)
end

function Activity5MiniGameRecordWindow.UpdateInfo()
  local info = Activity5_MiniGameData.GetMiniGameInfo(gameId)
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

function Activity5MiniGameRecordWindow.InitBtn()
  uis.Main.ReturnBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.Activity5MiniGameRecordWindow.name)
  end)
end

function Activity5MiniGameRecordWindow.OnClose()
  uis = nil
  contentPane = nil
end

return Activity5MiniGameRecordWindow
