require("ActivityDungeon1003_BossBattleByName")

function GetActivityDungeon1003_BossBattleWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1003_BossBattleUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
