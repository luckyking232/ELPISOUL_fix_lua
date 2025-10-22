require("ActivityDungeon1008_BossBattleByName")

function GetActivityDungeon1008_BossBattleWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1008_BossBattleUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
