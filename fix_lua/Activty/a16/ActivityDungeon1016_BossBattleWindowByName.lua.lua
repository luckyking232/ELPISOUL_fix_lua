require("ActivityDungeon1016_BossBattleByName")

function GetActivityDungeon1016_BossBattleWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1016_BossBattleUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
