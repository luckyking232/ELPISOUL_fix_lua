require("ActivityDungeon1021_BossBattleByName")

function GetActivityDungeon1021_BossBattleWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1021_BossBattleUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
