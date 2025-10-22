require("ActivityDungeon1022_BossBattleByName")

function GetActivityDungeon1022_BossBattleWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1022_BossBattleUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
