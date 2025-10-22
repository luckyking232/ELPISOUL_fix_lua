require("ActivityDungeon1006_MiniStart_EffectTipsByName")

function GetActivityDungeon1006_MiniStart_EffectTipsAniUis(ui)
  local uis = {}
  uis.Tips = GetActivityDungeon1006_MiniStart_EffectTipsUis(ui:GetChild("Tips"))
  uis.EffectHolder = ui:GetChild("EffectHolder")
  uis.root = ui
  return uis
end
