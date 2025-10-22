require("ActivityDungeon1003_Material_BattleByName")

function GetActivityDungeon1003_Material_BattleAniUis(ui)
  local uis = {}
  uis.Battle = GetActivityDungeon1003_Material_BattleUis(ui:GetChild("Battle"))
  uis.root = ui
  return uis
end
