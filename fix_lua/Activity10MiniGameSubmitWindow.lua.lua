require("ActivityDungeon1010_MiniStart_EndRewardWindowByName")
local Activity10MiniGameSubmitWindow = {}
local uis, contentPane, nowIntegral

function Activity10MiniGameSubmitWindow.ReInitData()
end

function Activity10MiniGameSubmitWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.Activity10MiniGameSubmitWindow.package, WinResConfig.Activity10MiniGameSubmitWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActivityDungeon1010_MiniStart_EndRewardWindowUis(contentPane)
    UIUtil.ChangeLoginScreenEffectOut()
    local holder = FairyGUI.UIObjectFactory.NewObject(FairyGUI.ObjectType.Graph)
    uis.Main.root:AddChild(holder)
    holder:SetSize(uis.Main.root.width, uis.Main.root.height)
    holder:SetPivot(0.5, 0.5, true)
    holder:Center()
    UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/Common/FX_ui_get_common.prefab", holder)
    nowIntegral = math.floor(bridgeObj.argTable[1])
    Activity10MiniGameSubmitWindow.UpdateInfo()
    Activity10MiniGameSubmitWindow.InitBtn()
    SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/sfx_game_chuanyue_end")
  end)
end

function Activity10MiniGameSubmitWindow.UpdateInfo()
  local againTxt = T(20490)
  local closeTxt = T(20530)
  UIUtil.SetText(uis.Main.CloseBtn, closeTxt, "WordTxt")
  UIUtil.SetText(uis.Main.AgainBtn, againTxt, "WordTxt")
  uis.Main.TitleTxt.text = T(1898)
  local info = Activity10_MiniGameData.GetMiniGameInfo()
  if info and nowIntegral > info.miniHighScore then
    uis.Main.WordTxt.text = T(1899)
  else
    uis.Main.WordTxt.text = ""
  end
  uis.Main.Word1Txt.text = T(1900, nowIntegral)
end

function Activity10MiniGameSubmitWindow.InitBtn()
  uis.Main.CloseBtn.onClick:Set(function()
    Activity10_MiniGameService.MiniGameSubmitReq({}, nowIntegral, nil, 0, function()
      UIMgr:CloseToWindow(WinResConfig.Activity10MiniGameMainWindow.name)
    end)
  end)
  uis.Main.AgainBtn.onClick:Set(function()
    Activity10_MiniGameService.MiniGameSubmitReq({}, nowIntegral, nil, 0, function()
      UIMgr:CloseWindow(WinResConfig.Activity10MiniGameSubmitWindow.name)
      UIMgr:SendWindowMessage(WinResConfig.Activity10MiniGameWindow.name, WindowMsgEnum.Activity10_MiniGame.START_GAME)
    end)
  end)
end

function Activity10MiniGameSubmitWindow.OnClose()
  uis = nil
  contentPane = nil
  nowIntegral = nil
end

return Activity10MiniGameSubmitWindow
