require("ActivityDungeon1004_MiniStart_WinWindowByName")
local Activity5MiniGameWinWindow = {}
local uis, contentPane

function Activity5MiniGameWinWindow.ReInitData()
end

function Activity5MiniGameWinWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.Activity5MiniGameWinWindow.package, WinResConfig.Activity5MiniGameWinWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActivityDungeon1004_MiniStart_WinWindowUis(contentPane)
    Activity5MiniGameWinWindow.UpdateInfo()
    Activity5MiniGameWinWindow.InitBtn()
  end)
end

function Activity5MiniGameWinWindow.UpdateInfo()
  SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/sfx_ui_match3_vict")
  LeanTween.delayedCall(1, function()
    UIMgr:CloseWindow(WinResConfig.Activity5MiniGameWinWindow.name)
  end)
end

function Activity5MiniGameWinWindow.InitBtn()
end

function Activity5MiniGameWinWindow.OnClose()
  uis = nil
  contentPane = nil
end

return Activity5MiniGameWinWindow
