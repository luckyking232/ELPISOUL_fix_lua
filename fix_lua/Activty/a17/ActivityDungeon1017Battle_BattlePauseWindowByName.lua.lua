require("ActivityDungeon1017Battle_BattlePauseByName")

function GetActivityDungeon1017Battle_BattlePauseWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1017Battle_BattlePauseUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
