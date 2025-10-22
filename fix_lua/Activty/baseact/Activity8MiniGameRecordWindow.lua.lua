require("ActivityDungeon1007_MiniIntegralWindowByName")
local Activity8MiniGameRecordWindow = {}
local uis, contentPane
local gameId = 70441009

function Activity8MiniGameRecordWindow.ReInitData()
end

function Activity8MiniGameRecordWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.Activity8MiniGameRecordWindow.package, WinResConfig.Activity8MiniGameRecordWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActivityDungeon1007_MiniIntegralWindowUis(contentPane)
    Activity8MiniGameRecordWindow.UpdateInfo()
    Activity8MiniGameRecordWindow.InitBtn()
  end)
end

function Activity8MiniGameRecordWindow.UpdateInfo()
  local info = Activity8_MiniGameData.GetMiniGameInfo(gameId)
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
    local rewardTipsTxt = T(20642, point)
    if point >= math.floor(info.miniHighScore) then
      rewardTipsTxt = T(20641, point)
    end
    UIUtil.SetText(child, rewardTipsTxt, "WordTxt")
  end
  
  list.numItems = records and #records or 0
  for i = 0, list.numChildren - 1 do
    local child = list:GetChildAt(i)
    child:GetChild("Tips").alpha = 0
    PlayUITrans(child, "up", nil, i * 0.03)
  end
end

function Activity8MiniGameRecordWindow.InitBtn()
  uis.Main.ReturnBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.Activity8MiniGameRecordWindow.name)
  end)
end

function Activity8MiniGameRecordWindow.OnClose()
  uis = nil
  contentPane = nil
end

return Activity8MiniGameRecordWindow
