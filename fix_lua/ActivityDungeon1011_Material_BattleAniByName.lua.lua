require("ActivityDungeon1011_Material_BattleByName")

function GetActivityDungeon1011_Material_BattleAniUis(ui)
  local uis = {}
  uis.Battle = GetActivityDungeon1011_Material_BattleUis(ui:GetChild("Battle"))
  uis.root = ui
  return uis
end
