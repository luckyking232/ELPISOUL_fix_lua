require("ActivityDungeon1013_MiniStart2_EndRewardWindowByName")
local Activity13CarGameSubmitWindow = {}
local uis, contentPane, nowIntegral, stageId

function Activity13CarGameSubmitWindow.ReInitData()
end

function Activity13CarGameSubmitWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.Activity13CarGameSubmitWindow.package, WinResConfig.Activity13CarGameSubmitWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActivityDungeon1013_MiniStart2_EndRewardWindowUis(contentPane)
    nowIntegral = math.floor(bridgeObj.argTable[1])
    stageId = bridgeObj.argTable[2]
    UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/Common/FX_ui_get_common.prefab", uis.Main.EffectHolder)
    Activity13CarGameSubmitWindow.UpdateInfo()
    Activity13CarGameSubmitWindow.InitBtn()
    SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/sfx_game_chuanyue_end")
  end)
end

function Activity13CarGameSubmitWindow.UpdateInfo()
  local againTxt = T(20490)
  local closeTxt = T(20530)
  UIUtil.SetText(uis.Main.CloseBtn, closeTxt, "WordTxt")
  UIUtil.SetText(uis.Main.AgainBtn, againTxt, "WordTxt")
  uis.Main.TitleTxt.text = T(1989)
  uis.Main.WordTxt.text = T(1990)
  uis.Main.NumberTxt.text = nowIntegral
end

function Activity13CarGameSubmitWindow.InitBtn()
  local gameId = 70441017
  local map = {}
  map[stageId] = 1
  uis.Main.CloseBtn.onClick:Set(function()
    Activity13_MiniGameService.MiniGameSubmitReq(gameId, map, nowIntegral, nil, function()
      UIMgr:CloseToWindow(WinResConfig.Activity13CarGameMainWindow.name)
    end)
  end)
  uis.Main.AgainBtn.onClick:Set(function()
    Activity13_MiniGameService.MiniGameSubmitReq(gameId, map, nowIntegral, nil, function()
      UIMgr:CloseWindow(WinResConfig.Activity13CarGameSubmitWindow.name)
    end)
  end)
end

function Activity13CarGameSubmitWindow.OnClose()
  uis = nil
  contentPane = nil
  stageId = nil
  nowIntegral = nil
end

return Activity13CarGameSubmitWindow
