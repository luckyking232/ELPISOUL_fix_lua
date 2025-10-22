require("ActivityDungeon1015_MiniTipsWindowByName")
local Activity15MiniExplainWindow = {}
local uis, contentPane, closeCallback

function Activity15MiniExplainWindow.ReInitData()
end

function Activity15MiniExplainWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.Activity15MiniExplainWindow.package, WinResConfig.Activity15MiniExplainWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActivityDungeon1015_MiniTipsWindowUis(contentPane)
    closeCallback = bridgeObj.argTable[1]
    Activity15MiniExplainWindow.UpdateInfo()
    Activity15MiniExplainWindow.InitBtn()
  end)
end

function Activity15MiniExplainWindow.UpdateInfo()
end

function Activity15MiniExplainWindow.InitBtn()
  uis.Main.TouchScreenBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.Activity15MiniExplainWindow.name)
  end)
  uis.Main.Tips.CloseBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.Activity15MiniExplainWindow.name)
  end)
end

function Activity15MiniExplainWindow.OnClose()
  uis = nil
  contentPane = nil
  if closeCallback then
    closeCallback()
    closeCallback = nil
  end
end

return Activity15MiniExplainWindow
