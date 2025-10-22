require("ActivityDungeon1008_MiniIntegral2WindowByName")
local Activity9SnakeGameRecordWindow = {}
local uis, contentPane

function Activity9SnakeGameRecordWindow.ReInitData()
end

function Activity9SnakeGameRecordWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.Activity9SnakeGameRecordWindow.package, WinResConfig.Activity9SnakeGameRecordWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActivityDungeon1008_MiniIntegral2WindowUis(contentPane)
    Activity9SnakeGameRecordWindow.UpdateInfo()
    Activity9SnakeGameRecordWindow.InitBtn()
  end)
end

function Activity9SnakeGameRecordWindow.UpdateInfo()
  local gameId = Activity9_MiniGameData.snakeGameId
  local info = Activity9_MiniGameData.GetOneMiniGameInfo(gameId)
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
    if point >= math.floor(info.miniHighScore) then
      UIUtil.SetText(child, T(11809, point), "WordTxt")
    else
      UIUtil.SetText(child, T(11808, point), "WordTxt")
    end
  end
  
  list.numItems = records and #records or 0
  for i = 0, list.numChildren - 1 do
    local child = list:GetChildAt(i)
    child:GetChild("Tips").alpha = 0
    PlayUITrans(child, "up", nil, i * 0.03)
  end
end

function Activity9SnakeGameRecordWindow.GetGameTime(time)
  if nil == time or time <= 0 then
    return ""
  end
  local t = math.floor(time)
  local minutes = math.floor(t / 60)
  return T(1788, minutes, t % 60)
end

function Activity9SnakeGameRecordWindow.InitBtn()
  uis.Main.ReturnBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.Activity9SnakeGameRecordWindow.name)
  end)
end

function Activity9SnakeGameRecordWindow.OnClose()
  uis = nil
  contentPane = nil
end

return Activity9SnakeGameRecordWindow
