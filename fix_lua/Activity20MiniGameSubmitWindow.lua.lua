require("ActivityDungeon1020_MiniStart_EndRewardWindowByName")
local Activity20MiniGameSubmitWindow = {}
local uis, contentPane, progress, win, score

function Activity20MiniGameSubmitWindow.ReInitData()
end

function Activity20MiniGameSubmitWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.Activity20MiniGameSubmitWindow.package, WinResConfig.Activity20MiniGameSubmitWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActivityDungeon1020_MiniStart_EndRewardWindowUis(contentPane)
    progress = bridgeObj.argTable[1]
    win = bridgeObj.argTable[2]
    score = bridgeObj.argTable[score]
    UIUtil.ChangeLoginScreenEffectOut()
    if win then
      local holder = FairyGUI.UIObjectFactory.NewObject(FairyGUI.ObjectType.Graph)
      uis.Main.root:AddChild(holder)
      holder:SetSize(uis.Main.root.width, uis.Main.root.height)
      holder:SetPivot(0.5, 0.5, true)
      holder:Center()
      UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/Common/FX_ui_get_common.prefab", holder)
    end
    Activity20MiniGameSubmitWindow.UpdateInfo()
    Activity20MiniGameSubmitWindow.InitBtn()
    SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/sfx_game_chuanyue_end")
  end)
end

function Activity20MiniGameSubmitWindow.UpdateInfo()
  local againTxt = T(20490)
  local closeTxt = T(20530)
  local successTxt = T(20867)
  local failureTxt = T(20868)
  local successDesc = T(20869)
  local failureDesc = T(20870)
  UIUtil.SetText(uis.Main.CloseBtn, closeTxt, "WordTxt")
  UIUtil.SetText(uis.Main.AgainBtn, againTxt, "WordTxt")
  uis.Main.TitleTxt.text = win and successTxt or failureTxt
  uis.Main.Win.WordTxt.text = successDesc
  uis.Main.c1Ctr.selectedIndex = win and 0 or 1
  uis.Main.Fail.WordTxt.text = failureDesc
  uis.Main.Fail.Word1Txt.text = T(20871, progress)
end

function Activity20MiniGameSubmitWindow.InitBtn()
  uis.Main.CloseBtn.onClick:Set(function()
    UIMgr:CloseToWindow(WinResConfig.Activity20MiniGameMainWindow.name)
  end)
  uis.Main.AgainBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.Activity20MiniGameSubmitWindow.name)
    UIMgr:SendWindowMessage(WinResConfig.Activity20MiniGameWindow.name, WindowMsgEnum.Activity20_MiniGame.START_GAME)
  end)
end

function Activity20MiniGameSubmitWindow.OnClose()
  uis = nil
  contentPane = nil
end

return Activity20MiniGameSubmitWindow
