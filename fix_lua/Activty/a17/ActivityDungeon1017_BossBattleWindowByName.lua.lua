require("ActivityDungeon1017_BossBattleByName")

function GetActivityDungeon1017_BossBattleWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1017_BossBattleUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
