require("ActivityDungeon1013_EventTipsByName")

function GetActivityDungeon1013_EventTipsAniUis(ui)
  local uis = {}
  uis.EventTips = GetActivityDungeon1013_EventTipsUis(ui:GetChild("EventTips"))
  uis.EffectHolder = ui:GetChild("EffectHolder")
  uis.root = ui
  return uis
end
