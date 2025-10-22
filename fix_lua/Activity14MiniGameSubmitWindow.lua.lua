require("ActivityDungeon1014_MiniStart_EndRewardWindowByName")
local Activity14MiniGameSubmitWindow = {}
local uis, contentPane, score

function Activity14MiniGameSubmitWindow.ReInitData()
end

function Activity14MiniGameSubmitWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.Activity14MiniGameSubmitWindow.package, WinResConfig.Activity14MiniGameSubmitWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    score = bridgeObj.argTable[1]
    uis = GetActivityDungeon1014_MiniStart_EndRewardWindowUis(contentPane)
    Activity14MiniGameSubmitWindow.UpdateInfo()
    Activity14MiniGameSubmitWindow.InitBtn()
  end)
end

function Activity14MiniGameSubmitWindow.UpdateInfo()
  SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/sfx_game_chuanyue_end")
  local againTxt = T(20490)
  local closeTxt = T(20530)
  UIUtil.SetText(uis.Main.CloseBtn, closeTxt, "WordTxt")
  UIUtil.SetText(uis.Main.AgainBtn, againTxt, "WordTxt")
  uis.Main.TitleTxt.text = T(20770)
  local content = T(20776, score)
  local info = Activity14_MiniGameData.GetMiniGameInfo(70441018)
  if score > math.floor(info.miniHighScore) then
    content = T(20771, score)
    local holder = uis.Main.EffectHolder
    UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/Common/FX_ui_get_common.prefab", holder)
  end
  uis.Main.WordTxt.text = content
end

function Activity14MiniGameSubmitWindow.InitBtn()
  uis.Main.CloseBtn.onClick:Set(function()
    UIMgr:CloseToWindow(WinResConfig.Activity14MiniGameMainWindow.name)
  end)
  uis.Main.AgainBtn.onClick:Set(function()
    UIMgr:SendWindowMessage(WinResConfig.Activity14MiniGameWindow.name, WindowMsgEnum.Activity10_MiniGame.RESET)
    UIMgr:CloseWindow(WinResConfig.Activity14MiniGameSubmitWindow.name)
  end)
end

function Activity14MiniGameSubmitWindow.OnClose()
  uis = nil
  contentPane = nil
end

return Activity14MiniGameSubmitWindow
