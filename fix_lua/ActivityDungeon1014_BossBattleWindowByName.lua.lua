require("ActivityDungeon1014_BossBattleByName")

function GetActivityDungeon1014_BossBattleWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1014_BossBattleUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
