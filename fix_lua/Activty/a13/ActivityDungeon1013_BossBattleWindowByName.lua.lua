require("ActivityDungeon1013_BossBattleByName")

function GetActivityDungeon1013_BossBattleWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1013_BossBattleUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
