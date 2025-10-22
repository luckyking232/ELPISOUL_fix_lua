require("ActivityDungeon1005_BossBattleByName")

function GetActivityDungeon1005_BossBattleWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1005_BossBattleUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
