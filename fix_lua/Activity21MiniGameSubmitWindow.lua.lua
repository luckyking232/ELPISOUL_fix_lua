require("ActivityDungeon1021_MiniStart_EndRewardWindowByName")
local Activity21MiniGameSubmitWindow = {}
local uis, contentPane, score

function Activity21MiniGameSubmitWindow.ReInitData()
end

function Activity21MiniGameSubmitWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.Activity21MiniGameSubmitWindow.package, WinResConfig.Activity21MiniGameSubmitWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    score = bridgeObj.argTable[1]
    uis = GetActivityDungeon1021_MiniStart_EndRewardWindowUis(contentPane)
    Activity21MiniGameSubmitWindow.UpdateInfo()
    Activity21MiniGameSubmitWindow.InitBtn()
  end)
end

function Activity21MiniGameSubmitWindow.UpdateInfo()
  local againTxt = T(20490)
  local closeTxt = T(20530)
  local titleTxt = T(20637)
  local content = T(20879, score)
  UIUtil.SetText(uis.Main.CloseBtn, closeTxt, "WordTxt")
  UIUtil.SetText(uis.Main.AgainBtn, againTxt, "WordTxt")
  uis.Main.TitleTxt.text = titleTxt
  uis.Main.WordTxt.text = content
  local holder = uis.Main.root:AddChild(CS.FairyGUI.UIObjectFactory.NewObject(CS.FairyGUI.ObjectType.Graph))
  holder:Center()
  local effect = ResourceManager.Instantiate("Assets/Art/Effects/Prefab/UI_prefab/Common/FX_ui_get_common.prefab")
  UIUtil.SetObjectToUI(effect, holder)
  LuaUtil.PlayEffect(effect)
  SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/sfx_ui_keyin_damo")
end

function Activity21MiniGameSubmitWindow.InitBtn()
  uis.Main.CloseBtn.onClick:Set(function()
    UIMgr:CloseToWindow(WinResConfig.Activity21MiniGameMainWindow.name)
  end)
  uis.Main.AgainBtn.onClick:Set(function()
    UIMgr:SendWindowMessage(WinResConfig.Activity21MiniGameWindow.name, WindowMsgEnum.Activity21_MiniGame.RESET)
    UIMgr:CloseWindow(WinResConfig.Activity21MiniGameSubmitWindow.name)
  end)
end

function Activity21MiniGameSubmitWindow.OnClose()
  uis = nil
  contentPane = nil
end

return Activity21MiniGameSubmitWindow
