require("ActivityDungeon1017_EventTipsByName")

function GetActivityDungeon1017_EventTipsAniUis(ui)
  local uis = {}
  uis.EventTips = GetActivityDungeon1017_EventTipsUis(ui:GetChild("EventTips"))
  uis.EffectHolder = ui:GetChild("EffectHolder")
  uis.root = ui
  return uis
end
