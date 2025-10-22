require("ActivityDungeon1012_Material_BattleByName")

function GetActivityDungeon1012_Material_BattleAniUis(ui)
  local uis = {}
  uis.Battle = GetActivityDungeon1012_Material_BattleUis(ui:GetChild("Battle"))
  uis.root = ui
  return uis
end
