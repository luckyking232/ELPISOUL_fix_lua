require("ActivityDungeon1017_PassportUp_LevelUpTipsWindowByName")
local Activity17PassportLevelUpTipsWindow = {}
local uis, contentPane, lv

function Activity17PassportLevelUpTipsWindow.ReInitData()
end

function Activity17PassportLevelUpTipsWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.Activity17PassportLevelUpTipsWindow.package, WinResConfig.Activity17PassportLevelUpTipsWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActivityDungeon1017_PassportUp_LevelUpTipsWindowUis(contentPane)
    lv = bridgeObj.argTable[1]
    SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.CARD_LV_UP_SUCCEED)
    Activity17PassportLevelUpTipsWindow.UpdateInfo()
    Activity17PassportLevelUpTipsWindow.InitBtn()
  end)
end

function Activity17PassportLevelUpTipsWindow.UpdateInfo()
  uis.Main.SubtitleTxt.text = T(37)
  if lv then
    uis.Main.LevelTxt.text = lv
  end
  UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/Common/FX_ui_get_common.prefab", uis.Main.EffectHolder)
end

function Activity17PassportLevelUpTipsWindow.InitBtn()
  uis.Main.TouchScreenBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.Activity17PassportLevelUpTipsWindow.name)
    SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.POPUP_WINDOW_CLOSE)
  end)
end

function Activity17PassportLevelUpTipsWindow.OnClose()
  uis = nil
  contentPane = nil
  lv = nil
end

return Activity17PassportLevelUpTipsWindow
