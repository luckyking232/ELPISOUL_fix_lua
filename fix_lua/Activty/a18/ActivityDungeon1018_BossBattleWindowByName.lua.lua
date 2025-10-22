require("ActivityDungeon1018_BossBattleByName")

function GetActivityDungeon1018_BossBattleWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1018_BossBattleUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
