require("ActivityDungeon1017Battle_BattleExitByName")

function GetActivityDungeon1017Battle_BattleExitWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1017Battle_BattleExitUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
