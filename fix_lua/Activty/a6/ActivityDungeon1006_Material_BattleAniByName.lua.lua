require("ActivityDungeon1006_Material_BattleByName")

function GetActivityDungeon1006_Material_BattleAniUis(ui)
  local uis = {}
  uis.Battle = GetActivityDungeon1006_Material_BattleUis(ui:GetChild("Battle"))
  uis.root = ui
  return uis
end
