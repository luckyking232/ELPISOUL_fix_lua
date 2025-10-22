require("ActivityDungeon1015_MiniStart_EndRewardWindowByName")
local Activity15MiniGameSubmitWindow = {}
local uis, contentPane, nowIntegral

function Activity15MiniGameSubmitWindow.ReInitData()
end

function Activity15MiniGameSubmitWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.Activity15MiniGameSubmitWindow.package, WinResConfig.Activity15MiniGameSubmitWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActivityDungeon1015_MiniStart_EndRewardWindowUis(contentPane)
    UIUtil.ChangeLoginScreenEffectOut()
    local holder = FairyGUI.UIObjectFactory.NewObject(FairyGUI.ObjectType.Graph)
    uis.Main.root:AddChild(holder)
    holder:SetSize(uis.Main.root.width, uis.Main.root.height)
    holder:SetPivot(0.5, 0.5, true)
    holder:Center()
    UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/Common/FX_ui_get_common.prefab", holder)
    nowIntegral = math.floor(bridgeObj.argTable[1])
    Activity15MiniGameSubmitWindow.UpdateInfo()
    Activity15MiniGameSubmitWindow.InitBtn()
    SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/sfx_game_chuanyue_end")
  end)
end

function Activity15MiniGameSubmitWindow.UpdateInfo()
  local againTxt = T(20490)
  local closeTxt = T(20530)
  UIUtil.SetText(uis.Main.CloseBtn, closeTxt, "WordTxt")
  UIUtil.SetText(uis.Main.AgainBtn, againTxt, "WordTxt")
  uis.Main.TitleTxt.text = T(2046)
  local info = Activity15_MiniGameData.GetMiniGameInfo()
  if info and nowIntegral > info.miniHighScore then
    uis.Main.WordTxt.text = T(2047, nowIntegral)
  else
    uis.Main.WordTxt.text = T(2048, nowIntegral)
  end
end

function Activity15MiniGameSubmitWindow.InitBtn()
  uis.Main.CloseBtn.onClick:Set(function()
    Activity15_MiniGameService.MiniGameSubmitReq({}, nowIntegral, nil, 0, function()
      UIMgr:CloseToWindow(WinResConfig.Activity15MiniGameMainWindow.name)
    end)
  end)
  uis.Main.AgainBtn.onClick:Set(function()
    Activity15_MiniGameService.MiniGameSubmitReq({}, nowIntegral, nil, 0, function()
      UIMgr:CloseWindow(WinResConfig.Activity15MiniGameSubmitWindow.name)
      UIMgr:SendWindowMessage(WinResConfig.Activity15MiniGameWindow.name, WindowMsgEnum.Activity15_MiniGame.START_GAME)
    end)
  end)
end

function Activity15MiniGameSubmitWindow.OnClose()
  uis = nil
  contentPane = nil
  nowIntegral = nil
end

return Activity15MiniGameSubmitWindow
