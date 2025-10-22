require("ActivityDungeon1007_MiniOperationWindowByName")
local Activity8MiniGameGuideWindow = {}
local uis, contentPane

function Activity8MiniGameGuideWindow.ReInitData()
end

function Activity8MiniGameGuideWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.Activity8MiniGameGuideWindow.package, WinResConfig.Activity8MiniGameGuideWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActivityDungeon1007_MiniOperationWindowUis(contentPane)
    Activity8MiniGameGuideWindow.UpdateInfo()
    Activity8MiniGameGuideWindow.InitBtn()
  end)
end

function Activity8MiniGameGuideWindow.UpdateInfo()
  uis.Main.WordTxt.text = T(20640)
  uis.Main.root.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.Activity8MiniGameGuideWindow.name)
  end)
end

function Activity8MiniGameGuideWindow.InitBtn()
end

function Activity8MiniGameGuideWindow.OnClose()
  uis = nil
  contentPane = nil
end

return Activity8MiniGameGuideWindow
