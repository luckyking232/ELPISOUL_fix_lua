require("ActivityDungeon1022_Material_BattleByName")

function GetActivityDungeon1022_Material_BattleAniUis(ui)
  local uis = {}
  uis.Battle = GetActivityDungeon1022_Material_BattleUis(ui:GetChild("Battle"))
  uis.root = ui
  return uis
end
