require("ActivityDungeon1020_Material_BattleByName")

function GetActivityDungeon1020_Material_BattleAniUis(ui)
  local uis = {}
  uis.Battle = GetActivityDungeon1020_Material_BattleUis(ui:GetChild("Battle"))
  uis.root = ui
  return uis
end
