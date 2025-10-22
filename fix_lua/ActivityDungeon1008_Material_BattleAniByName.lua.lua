require("ActivityDungeon1008_Material_BattleByName")

function GetActivityDungeon1008_Material_BattleAniUis(ui)
  local uis = {}
  uis.Battle = GetActivityDungeon1008_Material_BattleUis(ui:GetChild("Battle"))
  uis.root = ui
  return uis
end
