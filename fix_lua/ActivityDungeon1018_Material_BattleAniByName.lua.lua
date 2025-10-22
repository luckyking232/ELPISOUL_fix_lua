require("ActivityDungeon1018_Material_BattleByName")

function GetActivityDungeon1018_Material_BattleAniUis(ui)
  local uis = {}
  uis.Battle = GetActivityDungeon1018_Material_BattleUis(ui:GetChild("Battle"))
  uis.root = ui
  return uis
end
