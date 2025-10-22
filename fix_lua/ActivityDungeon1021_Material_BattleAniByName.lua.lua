require("ActivityDungeon1021_Material_BattleByName")

function GetActivityDungeon1021_Material_BattleAniUis(ui)
  local uis = {}
  uis.Battle = GetActivityDungeon1021_Material_BattleUis(ui:GetChild("Battle"))
  uis.root = ui
  return uis
end
