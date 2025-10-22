require("ActivityDungeon1007_Material_BattleByName")

function GetActivityDungeon1007_Material_BattleAniUis(ui)
  local uis = {}
  uis.Battle = GetActivityDungeon1007_Material_BattleUis(ui:GetChild("Battle"))
  uis.root = ui
  return uis
end
