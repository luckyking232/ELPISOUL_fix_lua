require("ActivityDungeon1011_BossBattleByName")

function GetActivityDungeon1011_BossBattleWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1011_BossBattleUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
