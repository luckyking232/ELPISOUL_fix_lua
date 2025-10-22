require("ActivityDungeon1013_Material_BattleByName")

function GetActivityDungeon1013_Material_BattleAniUis(ui)
  local uis = {}
  uis.Battle = GetActivityDungeon1013_Material_BattleUis(ui:GetChild("Battle"))
  uis.root = ui
  return uis
end
