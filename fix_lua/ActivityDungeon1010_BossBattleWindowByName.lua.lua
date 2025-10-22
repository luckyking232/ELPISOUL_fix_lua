require("ActivityDungeon1010_BossBattleByName")

function GetActivityDungeon1010_BossBattleWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1010_BossBattleUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
