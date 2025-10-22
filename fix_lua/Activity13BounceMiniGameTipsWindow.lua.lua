require("ActivityDungeon1013_MiniTipsWindowByName")
local Activity13BounceMiniGameTipsWindow = {}
local uis, contentPane
local AUTO_CLOSE_AFTER = 1
local delayTween

function Activity13BounceMiniGameTipsWindow.ReInitData()
end

function Activity13BounceMiniGameTipsWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.Activity13BounceMiniGameTipsWindow.package, WinResConfig.Activity13BounceMiniGameTipsWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActivityDungeon1013_MiniTipsWindowUis(contentPane)
    Activity13BounceMiniGameTipsWindow.UpdateInfo()
    Activity13BounceMiniGameTipsWindow.InitBtn()
  end)
end

function Activity13BounceMiniGameTipsWindow.UpdateInfo()
  uis.Main.WordTxt.text = T(11800)
  delayTween = LeanTween.delayedCall(AUTO_CLOSE_AFTER, function()
    UIMgr:CloseWindow(WinResConfig.Activity13BounceMiniGameTipsWindow.name)
  end).id
end

function Activity13BounceMiniGameTipsWindow.InitBtn()
  uis.Main.TouchScreenBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.Activity13BounceMiniGameTipsWindow.name)
  end)
end

function Activity13BounceMiniGameTipsWindow.OnClose()
  uis = nil
  contentPane = nil
  if delayTween then
    LeanTween.cancel(delayTween)
  end
  delayTween = nil
end

return Activity13BounceMiniGameTipsWindow
