require("ActivityDungeon1015_Material_BattleByName")

function GetActivityDungeon1015_Material_BattleAniUis(ui)
  local uis = {}
  uis.Battle = GetActivityDungeon1015_Material_BattleUis(ui:GetChild("Battle"))
  uis.root = ui
  return uis
end
