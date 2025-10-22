require("ActivityDungeon1017Battle_BattleUIByName")

function GetActivityDungeon1017Battle_BattleUIWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1017Battle_BattleUIUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
