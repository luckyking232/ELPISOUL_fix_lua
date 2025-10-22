require("ActivityDungeon1019_BossBattleByName")

function GetActivityDungeon1019_BossBattleWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1019_BossBattleUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
