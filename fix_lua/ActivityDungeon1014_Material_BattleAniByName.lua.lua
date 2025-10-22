require("ActivityDungeon1014_Material_BattleByName")

function GetActivityDungeon1014_Material_BattleAniUis(ui)
  local uis = {}
  uis.Battle = GetActivityDungeon1014_Material_BattleUis(ui:GetChild("Battle"))
  uis.root = ui
  return uis
end
