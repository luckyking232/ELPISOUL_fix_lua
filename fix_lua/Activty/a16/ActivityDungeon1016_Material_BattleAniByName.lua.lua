require("ActivityDungeon1016_Material_BattleByName")

function GetActivityDungeon1016_Material_BattleAniUis(ui)
  local uis = {}
  uis.Battle = GetActivityDungeon1016_Material_BattleUis(ui:GetChild("Battle"))
  uis.root = ui
  return uis
end
