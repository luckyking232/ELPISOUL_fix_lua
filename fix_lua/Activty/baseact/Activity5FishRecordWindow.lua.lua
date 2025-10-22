require("ActivityDungeon1004_MiniIntegralWindowByName")
local Activity5FishRecordWindow = {}
local uis, contentPane

function Activity5FishRecordWindow.ReInitData()
end

function Activity5FishRecordWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.Activity5FishRecordWindow.package, WinResConfig.Activity5FishRecordWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActivityDungeon1004_MiniIntegralWindowUis(contentPane)
    Activity5FishRecordWindow.UpdateInfo()
    Activity5FishRecordWindow.InitBtn()
  end)
end

function Activity5FishRecordWindow.UpdateInfo()
  local gameId = 70441006
  local info = Activity5_MiniGameData.GetMiniGameInfo(gameId)
  local records = info.records
  local list = uis.Main.TipsList
  table.sort(records, function(x, y)
    return x.stamp > y.stamp
  end)
  local GetID = function(map)
    for i, v in pairs(map) do
      return {id = i, state = v}
    end
  end
  
  function list.itemRenderer(i, gcmp)
    local record = records[i + 1]
    local stamp = record.stamp
    local point = record.point
    local child = gcmp:GetChild("Tips")
    local time = TimeUtil.FormatOfflineTime(LoginData.GetCurServerTime() - stamp)
    UIUtil.SetText(child, time, "TimeTxt")
    local info = GetID(record.counts)
    if info then
      local fishData = TableData.GetConfig(info.id, "BaseActivityGameItem")
      if fishData then
        child:GetChild("PicLoader").url = UIUtil.GetResUrl(fishData.icon)
        if fishData.sort then
          if 1 == info.state then
            UIUtil.SetText(child, T(1707, fishData.name()), "WordTxt")
            UIUtil.SetText(child:GetChild("First"), T(1716), "WordTxt")
            ChangeUIController(child, "c1", 1)
          else
            ChangeUIController(child, "c1", 0)
            UIUtil.SetText(child, T(1706, fishData.name()), "WordTxt")
          end
        else
          UIUtil.SetText(child, T(1715, fishData.name()), "WordTxt")
        end
      end
    end
  end
  
  list.numItems = records and #records or 0
  for i = 0, list.numChildren - 1 do
    local child = list:GetChildAt(i)
    child:GetChild("Tips").alpha = 0
    PlayUITrans(child, "up", nil, i * 0.03)
  end
end

function Activity5FishRecordWindow.InitBtn()
  uis.Main.ReturnBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.Activity5FishRecordWindow.name)
  end)
end

function Activity5FishRecordWindow.OnClose()
  uis = nil
  contentPane = nil
end

return Activity5FishRecordWindow
