require("ActivityDungeon1008_MiniStart2_EndRewardWindowByName")
local Activity9SnakeGameResultWindow = {}
local uis, contentPane

function Activity9SnakeGameResultWindow.ReInitData()
end

function Activity9SnakeGameResultWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.Activity9SnakeGameResultWindow.package, WinResConfig.Activity9SnakeGameResultWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActivityDungeon1008_MiniStart2_EndRewardWindowUis(contentPane)
    local point = bridgeObj.argTable[1]
    local lastHighScore = bridgeObj.argTable[2]
    Activity9SnakeGameResultWindow.UpdateInfo(point, lastHighScore)
    Activity9SnakeGameResultWindow.InitBtn()
    UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/Common/FX_ui_get_common.prefab", uis.Main.EffectHolder)
    SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.ACTIVITY_MINING_END)
  end)
end

function Activity9SnakeGameResultWindow.UpdateInfo(point, lastHighScore)
  uis.Main.TitleTxt.text = T(11803)
  if lastHighScore < point then
    uis.Main.WordTxt.text = T(11810)
    SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/sfx_zuma_vic")
  else
    uis.Main.WordTxt.text = T(11804)
    SoundUtil.PlayUISfx("event:/sfx/sfx_ui/ui_sys/ui_sfx_tanchishe_end_fail")
  end
  uis.Main.NumberTxt.text = point
end

function Activity9SnakeGameResultWindow.InitBtn()
  local againBtn = uis.Main.AgainBtn
  UIUtil.SetBtnText(againBtn, T(11805))
  againBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.Activity9SnakeGameResultWindow.name)
    UIMgr:SendWindowMessage(WinResConfig.Activity9SnakeGameWindow.name, WindowMsgEnum.Activity9_MiniGame.RESET)
  end)
  local closeBtn = uis.Main.CloseBtn
  UIUtil.SetBtnText(closeBtn, T(11806))
  closeBtn.onClick:Set(function()
    if UIMgr:IsWindowInList(WinResConfig.Activity9SnakeGameMainWindow.name) then
      UIMgr:CloseToWindow(WinResConfig.Activity9SnakeGameMainWindow.name)
    else
      UIMgr:CloseWindow(WinResConfig.Activity9SnakeGameResultWindow.name)
    end
  end)
end

function Activity9SnakeGameResultWindow.OnClose()
  uis = nil
  contentPane = nil
end

return Activity9SnakeGameResultWindow
