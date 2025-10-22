require("ActivityDungeon1017_MiniStart_EndRewardWindowByName")
local Activity17DodgerGameSubmitWindow = {}
local uis, contentPane, score

function Activity17DodgerGameSubmitWindow.ReInitData()
end

function Activity17DodgerGameSubmitWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.Activity17DodgerGameSubmitWindow.package, WinResConfig.Activity17DodgerGameSubmitWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    score = bridgeObj.argTable[1]
    uis = GetActivityDungeon1017_MiniStart_EndRewardWindowUis(contentPane)
    Activity17DodgerGameSubmitWindow.UpdateInfo()
    Activity17DodgerGameSubmitWindow.InitBtn()
  end)
end

function Activity17DodgerGameSubmitWindow.UpdateInfo()
  local againTxt = T(20490)
  local closeTxt = T(20530)
  local titleTxt = T(20781)
  SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/sfx_game_chuanyue_end")
  UIUtil.SetText(uis.Main.CloseBtn, closeTxt, "WordTxt")
  UIUtil.SetText(uis.Main.AgainBtn, againTxt, "WordTxt")
  UIUtil.SetText(uis.Main.root, titleTxt, "TitleTxt")
  UIUtil.SetText(uis.Main.root, T(20788, score), "WordTxt")
end

function Activity17DodgerGameSubmitWindow.InitBtn()
  uis.Main.CloseBtn.onClick:Set(function()
    UIMgr:CloseToWindow(WinResConfig.Activity17DodgerGameMainWindow.name)
  end)
  uis.Main.AgainBtn.onClick:Set(function()
    UIMgr:SendWindowMessage(WinResConfig.Activity17DodgerGameWindow.name, WindowMsgEnum.Activity17_MiniGame.RESET)
    UIMgr:CloseWindow(WinResConfig.Activity17DodgerGameSubmitWindow.name)
  end)
end

function Activity17DodgerGameSubmitWindow.OnClose()
  uis = nil
  contentPane = nil
end

return Activity17DodgerGameSubmitWindow
