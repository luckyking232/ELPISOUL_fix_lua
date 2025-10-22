require("ActivityDungeon1017Battle_BattleTopByName")
require("ActivityDungeon1017Battle_BottomByName")

function GetActivityDungeon1017Battle_BattleUIUis(ui)
  local uis = {}
  uis.Top = GetActivityDungeon1017Battle_BattleTopUis(ui:GetChild("Top"))
  uis.Bottom = GetActivityDungeon1017Battle_BottomUis(ui:GetChild("Bottom"))
  uis.root = ui
  return uis
end
