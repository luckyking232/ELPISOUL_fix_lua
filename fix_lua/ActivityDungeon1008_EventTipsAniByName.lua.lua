require("ActivityDungeon1008_EventTipsByName")

function GetActivityDungeon1008_EventTipsAniUis(ui)
  local uis = {}
  uis.EventTips = GetActivityDungeon1008_EventTipsUis(ui:GetChild("EventTips"))
  uis.EffectHolder = ui:GetChild("EffectHolder")
  uis.root = ui
  return uis
end
