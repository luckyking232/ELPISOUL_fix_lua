require("ActivityDungeon1004_BossBattleByName")

function GetActivityDungeon1004_BossBattleWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1004_BossBattleUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
