require("ActivityDungeon1006_MiniStart_CountdownWindowByName")
local Activity7MiniGameCountdownWindow = {}
local uis, contentPane

function Activity7MiniGameCountdownWindow.ReInitData()
end

function Activity7MiniGameCountdownWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.Activity7MiniGameCountdownWindow.package, WinResConfig.Activity7MiniGameCountdownWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActivityDungeon1006_MiniStart_CountdownWindowUis(contentPane)
    Activity7MiniGameCountdownWindow.UpdateInfo()
    Activity7MiniGameCountdownWindow.InitBtn()
    SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/sfx_ui_llk_show")
  end)
end

function Activity7MiniGameCountdownWindow.UpdateInfo()
  uis.Main.WordTxt.text = T(1781)
  LeanTween.delayedCall(1, function()
    UIMgr:CloseWindow(WinResConfig.Activity7MiniGameCountdownWindow.name)
    UIMgr:SendWindowMessage(WinResConfig.Activity7MiniGameWindow.name, WindowMsgEnum.Activity7_MiniGame.PAUSE)
  end)
end

function Activity7MiniGameCountdownWindow.InitBtn()
end

function Activity7MiniGameCountdownWindow.OnClose()
  uis = nil
  contentPane = nil
  UIMgr:SendWindowMessage(WinResConfig.Activity7MiniGameWindow.name, WindowMsgEnum.Activity7_MiniGame.START_GAME)
end

function Activity7MiniGameCountdownWindow.HandleMessage(msgId, para)
end

return Activity7MiniGameCountdownWindow
