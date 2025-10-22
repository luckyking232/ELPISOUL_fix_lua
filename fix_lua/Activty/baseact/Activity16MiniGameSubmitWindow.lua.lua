require("ActivityDungeon1016_MiniStart_EndRewardWindowByName")
local Activity16MiniGameSubmitWindow = {}
local uis, contentPane, score

function Activity16MiniGameSubmitWindow.ReInitData()
end

function Activity16MiniGameSubmitWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.Activity16MiniGameSubmitWindow.package, WinResConfig.Activity16MiniGameSubmitWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    score = bridgeObj.argTable[1]
    uis = GetActivityDungeon1016_MiniStart_EndRewardWindowUis(contentPane)
    Activity16MiniGameSubmitWindow.UpdateInfo()
    Activity16MiniGameSubmitWindow.InitBtn()
  end)
end

function Activity16MiniGameSubmitWindow.UpdateInfo()
  local againTxt = T(20490)
  local closeTxt = T(20530)
  local succeedTitleTxt = T(20781)
  UIUtil.SetText(uis.Main.CloseBtn, closeTxt, "WordTxt")
  UIUtil.SetText(uis.Main.AgainBtn, againTxt, "WordTxt")
  uis.Main.TitleTxt.text = succeedTitleTxt
  uis.Main.WordTxt.text = T(20782)
  uis.Main.Word1Txt.text = score
  local holder = uis.Main.root:AddChild(CS.FairyGUI.UIObjectFactory.NewObject(CS.FairyGUI.ObjectType.Graph))
  holder:Center()
  local effect = ResourceManager.Instantiate("Assets/Art/Effects/Prefab/UI_prefab/Common/FX_ui_get_common.prefab")
  UIUtil.SetObjectToUI(effect, holder)
  LuaUtil.PlayEffect(effect)
  SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/sfx_game_chuanyue_end")
end

function Activity16MiniGameSubmitWindow.InitBtn()
  uis.Main.CloseBtn.onClick:Set(function()
    UIMgr:CloseToWindow(WinResConfig.Activity16MiniGameMainWindow.name)
  end)
  uis.Main.AgainBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.Activity16MiniGameSubmitWindow.name)
    UIMgr:SendWindowMessage(WinResConfig.Activity16MiniGameWindow.name, WindowMsgEnum.Activity16_MiniGame.RESET)
  end)
end

function Activity16MiniGameSubmitWindow.OnClose()
  uis = nil
  contentPane = nil
end

return Activity16MiniGameSubmitWindow
