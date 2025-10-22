require("ActivityDungeon1013_PassportUp_LevelUpTipsWindowByName")
local Activity13PassportLevelUpTipsWindow = {}
local uis, contentPane, lv

function Activity13PassportLevelUpTipsWindow.ReInitData()
end

function Activity13PassportLevelUpTipsWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.Activity13PassportLevelUpTipsWindow.package, WinResConfig.Activity13PassportLevelUpTipsWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetActivityDungeon1013_PassportUp_LevelUpTipsWindowUis(contentPane)
    lv = bridgeObj.argTable[1]
    SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.CARD_LV_UP_SUCCEED)
    Activity13PassportLevelUpTipsWindow.UpdateInfo()
    Activity13PassportLevelUpTipsWindow.InitBtn()
  end)
end

function Activity13PassportLevelUpTipsWindow.UpdateInfo()
  uis.Main.SubtitleTxt.text = T(37)
  if lv then
    uis.Main.LevelTxt.text = lv
  end
  UIUtil.SetEffectToUI("Assets/Art/Effects/Prefab/UI_prefab/Common/FX_ui_get_common.prefab", uis.Main.EffectHolder)
end

function Activity13PassportLevelUpTipsWindow.InitBtn()
  uis.Main.TouchScreenBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.Activity13PassportLevelUpTipsWindow.name)
    SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.POPUP_WINDOW_CLOSE)
  end)
end

function Activity13PassportLevelUpTipsWindow.OnClose()
  uis = nil
  contentPane = nil
  lv = nil
end

return Activity13PassportLevelUpTipsWindow
