require("ActivityDungeon1017Battle_BattleEndByName")

function GetActivityDungeon1017Battle_BattleEndWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1017Battle_BattleEndUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
