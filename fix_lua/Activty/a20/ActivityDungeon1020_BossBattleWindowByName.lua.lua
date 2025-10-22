require("ActivityDungeon1020_BossBattleByName")

function GetActivityDungeon1020_BossBattleWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1020_BossBattleUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
