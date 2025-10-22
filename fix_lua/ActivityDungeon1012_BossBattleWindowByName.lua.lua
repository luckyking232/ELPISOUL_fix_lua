require("ActivityDungeon1012_BossBattleByName")

function GetActivityDungeon1012_BossBattleWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1012_BossBattleUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
