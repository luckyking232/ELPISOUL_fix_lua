require("ActivityDungeon1003_MiniStart_EndRewardWindowByName")
local Activity4MiniGameSubmitWindow = {}
local uis, contentPane, nowIntegral, consumeSeconds

function Activity4MiniGameSubmitWindow.ReInitData()
end

function Activity4MiniGameSubmitWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.Activity4MiniGameSubmitWindow.package, WinResConfig.Activity4MiniGameSubmitWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActivityDungeon1003_MiniStart_EndRewardWindowUis(contentPane)
    nowIntegral = bridgeObj.argTable[1]
    consumeSeconds = math.floor(bridgeObj.argTable[2])
    Activity4MiniGameSubmitWindow.UpdateInfo()
    Activity4MiniGameSubmitWindow.InitBtn()
    SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.ACTIVITY_MINING_END)
  end)
end

function Activity4MiniGameSubmitWindow.UpdateInfo()
  local againTxt = T(20490)
  local closeTxt = T(20530)
  UIUtil.SetText(uis.Main.CloseBtn, closeTxt, "WordTxt")
  UIUtil.SetText(uis.Main.AgainBtn, againTxt, "WordTxt")
  uis.Main.TitleTxt.text = T(1680)
  uis.Main.NumberWordTxt.text = T(1681)
  uis.Main.NumberTxt.text = nowIntegral
end

function Activity4MiniGameSubmitWindow.InitBtn()
  uis.Main.CloseBtn.onClick:Set(function()
    Activity4_MiniGameService.MiniGameSubmitReq({}, nowIntegral, consumeSeconds, function()
      UIMgr:CloseToWindow(WinResConfig.Activity4MiniGameMainWindow.name)
    end)
  end)
  uis.Main.AgainBtn.onClick:Set(function()
    Activity4_MiniGameService.MiniGameSubmitReq({}, nowIntegral, consumeSeconds, function()
      UIMgr:CloseWindow(WinResConfig.Activity4MiniGameSubmitWindow.name)
      OpenWindow(WinResConfig.Activity4MiniGameCountdownWindow.name)
    end)
  end)
end

function Activity4MiniGameSubmitWindow.OnClose()
  uis = nil
  contentPane = nil
  consumeSeconds = nil
  nowIntegral = nil
end

return Activity4MiniGameSubmitWindow
