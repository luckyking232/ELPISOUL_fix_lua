require("ActivityDungeon1004_Material_BattleByName")

function GetActivityDungeon1004_Material_BattleAniUis(ui)
  local uis = {}
  uis.Battle = GetActivityDungeon1004_Material_BattleUis(ui:GetChild("Battle"))
  uis.root = ui
  return uis
end
