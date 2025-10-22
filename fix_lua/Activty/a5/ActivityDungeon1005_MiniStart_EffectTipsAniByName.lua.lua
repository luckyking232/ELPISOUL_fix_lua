require("ActivityDungeon1005_MiniStart_EffectTipsByName")

function GetActivityDungeon1005_MiniStart_EffectTipsAniUis(ui)
  local uis = {}
  uis.Tips = GetActivityDungeon1005_MiniStart_EffectTipsUis(ui:GetChild("Tips"))
  uis.EffectHolder = ui:GetChild("EffectHolder")
  uis.root = ui
  return uis
end
