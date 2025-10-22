require("ActivityDungeon1017_MiniStart_PlayerDotByName")

function GetActivityDungeon1017_MiniStart_PlayerUis(ui)
  local uis = {}
  uis.Dot = GetActivityDungeon1017_MiniStart_PlayerDotUis(ui:GetChild("Dot"))
  uis.EffectHolder = ui:GetChild("EffectHolder")
  uis.root = ui
  return uis
end
