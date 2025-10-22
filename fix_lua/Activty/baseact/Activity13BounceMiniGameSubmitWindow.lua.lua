require("ActivityDungeon1013_MiniStart_EndRewardWindowByName")
local Activity13BounceMiniGameSubmitWindow = {}
local uis, contentPane, score, succeed

function Activity13BounceMiniGameSubmitWindow.ReInitData()
end

function Activity13BounceMiniGameSubmitWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.Activity13BounceMiniGameSubmitWindow.package, WinResConfig.Activity13BounceMiniGameSubmitWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActivityDungeon1013_MiniStart_EndRewardWindowUis(contentPane)
    score = bridgeObj.argTable[1]
    succeed = bridgeObj.argTable[2]
    Activity13BounceMiniGameSubmitWindow.UpdateInfo()
    Activity13BounceMiniGameSubmitWindow.InitBtn()
  end)
end

function Activity13BounceMiniGameSubmitWindow.UpdateInfo()
  local againTxt = T(20490)
  local closeTxt = T(20530)
  local succeedTitleTxt = T(20760)
  local failureTitleTxt = T(20761)
  local succeedDescTxt = T(20762)
  local failureDescTxt = T(20763)
  UIUtil.SetText(uis.Main.CloseBtn, closeTxt, "WordTxt")
  UIUtil.SetText(uis.Main.AgainBtn, againTxt, "WordTxt")
  UIUtil.SetText(uis.Main.root, succeed and succeedTitleTxt or failureTitleTxt, "TitleTxt")
  UIUtil.SetText(uis.Main.root, succeed and succeedDescTxt or failureDescTxt, "WordTxt")
  UIUtil.SetText(uis.Main.root, score, "NumberTxt")
  if succeed then
    local holder = uis.Main.root:AddChild(CS.FairyGUI.UIObjectFactory.NewObject(CS.FairyGUI.ObjectType.Graph))
    holder:Center()
    UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/Common/FX_ui_get_common.prefab", holder)
  end
  SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/sfx_game_chuanyue_end")
end

function Activity13BounceMiniGameSubmitWindow.InitBtn()
  uis.Main.CloseBtn.onClick:Set(function()
    UIMgr:CloseToWindow(WinResConfig.Activity13BounceMiniGameMainWindow.name)
  end)
  uis.Main.AgainBtn.onClick:Set(function()
    UIMgr:SendWindowMessage(WinResConfig.Activity13BounceMiniGameWindow.name, WindowMsgEnum.Activity13_MiniGame.RESET)
    UIMgr:CloseWindow(WinResConfig.Activity13BounceMiniGameSubmitWindow.name)
  end)
end

function Activity13BounceMiniGameSubmitWindow.OnClose()
  uis = nil
  contentPane = nil
end

return Activity13BounceMiniGameSubmitWindow
