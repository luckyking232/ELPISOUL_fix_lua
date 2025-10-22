require("ActivityDungeon1005_Material_BattleByName")

function GetActivityDungeon1005_Material_BattleAniUis(ui)
  local uis = {}
  uis.Battle = GetActivityDungeon1005_Material_BattleUis(ui:GetChild("Battle"))
  uis.root = ui
  return uis
end
