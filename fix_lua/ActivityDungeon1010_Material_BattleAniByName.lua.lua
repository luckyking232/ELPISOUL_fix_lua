require("ActivityDungeon1010_Material_BattleByName")

function GetActivityDungeon1010_Material_BattleAniUis(ui)
  local uis = {}
  uis.Battle = GetActivityDungeon1010_Material_BattleUis(ui:GetChild("Battle"))
  uis.root = ui
  return uis
end
