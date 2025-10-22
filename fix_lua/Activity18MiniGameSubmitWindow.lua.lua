require("ActivityDungeon1018_MiniStart_EndRewardWindowByName")
local Activity18MiniGameSubmitWindow = {}
local uis, contentPane, nowIntegral

function Activity18MiniGameSubmitWindow.ReInitData()
end

function Activity18MiniGameSubmitWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.Activity18MiniGameSubmitWindow.package, WinResConfig.Activity18MiniGameSubmitWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActivityDungeon1018_MiniStart_EndRewardWindowUis(contentPane)
    UIUtil.ChangeLoginScreenEffectOut()
    local holder = FairyGUI.UIObjectFactory.NewObject(FairyGUI.ObjectType.Graph)
    uis.Main.root:AddChild(holder)
    holder:SetSize(uis.Main.root.width, uis.Main.root.height)
    holder:SetPivot(0.5, 0.5, true)
    holder:Center()
    UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/Common/FX_ui_get_common.prefab", holder)
    nowIntegral = math.floor(bridgeObj.argTable[1])
    Activity18MiniGameSubmitWindow.UpdateInfo()
    Activity18MiniGameSubmitWindow.InitBtn()
    SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/sfx_game_chuanyue_end")
  end)
end

function Activity18MiniGameSubmitWindow.UpdateInfo()
  local againTxt = T(20490)
  local closeTxt = T(20530)
  UIUtil.SetText(uis.Main.CloseBtn, closeTxt, "WordTxt")
  UIUtil.SetText(uis.Main.AgainBtn, againTxt, "WordTxt")
  uis.Main.TitleTxt.text = T(2120)
  uis.Main.Word1Txt.text = nowIntegral
  uis.Main.WordTxt.text = T(2119)
end

function Activity18MiniGameSubmitWindow.InitBtn()
  uis.Main.CloseBtn.onClick:Set(function()
    Activity18_MiniGameService.MiniGameSubmitReq({}, nowIntegral, nil, 0, function()
      UIMgr:CloseToWindow(WinResConfig.Activity18MiniGameMainWindow.name)
    end)
  end)
  uis.Main.AgainBtn.onClick:Set(function()
    Activity18_MiniGameService.MiniGameSubmitReq({}, nowIntegral, nil, 0, function()
      UIMgr:CloseWindow(WinResConfig.Activity18MiniGameSubmitWindow.name)
      UIMgr:SendWindowMessage(WinResConfig.Activity18MiniGameWindow.name, WindowMsgEnum.Activity18_MiniGame.START_GAME)
    end)
  end)
end

function Activity18MiniGameSubmitWindow.OnClose()
  uis = nil
  contentPane = nil
  nowIntegral = nil
end

return Activity18MiniGameSubmitWindow
