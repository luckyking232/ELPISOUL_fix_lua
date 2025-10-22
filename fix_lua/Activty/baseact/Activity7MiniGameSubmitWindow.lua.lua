require("ActivityDungeon1006_MiniStart_EndRewardWindowByName")
local Activity7MiniGameSubmitWindow = {}
local uis, contentPane, nowIntegral, stageId

function Activity7MiniGameSubmitWindow.ReInitData()
end

function Activity7MiniGameSubmitWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.Activity7MiniGameSubmitWindow.package, WinResConfig.Activity7MiniGameSubmitWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActivityDungeon1006_MiniStart_EndRewardWindowUis(contentPane)
    nowIntegral = math.floor(bridgeObj.argTable[1])
    stageId = bridgeObj.argTable[2]
    UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/Common/FX_ui_get_common.prefab", uis.Main.EffectHolder)
    Activity7MiniGameSubmitWindow.UpdateInfo()
    Activity7MiniGameSubmitWindow.InitBtn()
    SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.ACTIVITY_MINING_END)
  end)
end

function Activity7MiniGameSubmitWindow.UpdateInfo()
  local againTxt = T(20490)
  local closeTxt = T(20530)
  UIUtil.SetText(uis.Main.CloseBtn, closeTxt, "WordTxt")
  UIUtil.SetText(uis.Main.AgainBtn, againTxt, "WordTxt")
  uis.Main.TitleTxt.text = T(1789)
  uis.Main.NumberWordTxt.text = T(1790)
  uis.Main.NumberTxt.text = Activity7MiniGameSubmitWindow.GetGameTime(nowIntegral)
end

function Activity7MiniGameSubmitWindow.GetGameTime(time)
  if nil == time or time <= 0 then
    return ""
  end
  local t = math.floor(time)
  local minutes = math.floor(t / 60)
  return T(1788, minutes, t % 60)
end

function Activity7MiniGameSubmitWindow.InitBtn()
  local map = {}
  map[stageId] = 1
  uis.Main.CloseBtn.onClick:Set(function()
    Activity7_MiniGameService.MiniGameSubmitReq(map, nowIntegral, stageId, function()
      UIMgr:CloseToWindow(WinResConfig.Activity7MiniGameMainWindow.name)
    end)
  end)
  uis.Main.AgainBtn.onClick:Set(function()
    Activity7_MiniGameService.MiniGameSubmitReq(map, nowIntegral, stageId, function()
      UIMgr:CloseWindow(WinResConfig.Activity7MiniGameSubmitWindow.name)
      OpenWindow(WinResConfig.Activity7MiniGameCountdownWindow.name)
    end)
  end)
end

function Activity7MiniGameSubmitWindow.OnClose()
  uis = nil
  contentPane = nil
  stageId = nil
  nowIntegral = nil
end

return Activity7MiniGameSubmitWindow
