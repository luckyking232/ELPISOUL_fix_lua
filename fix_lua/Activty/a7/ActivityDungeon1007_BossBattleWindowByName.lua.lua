require("ActivityDungeon1007_BossBattleByName")

function GetActivityDungeon1007_BossBattleWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1007_BossBattleUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
