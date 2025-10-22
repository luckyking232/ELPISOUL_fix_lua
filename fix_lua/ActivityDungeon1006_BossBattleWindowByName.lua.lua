require("ActivityDungeon1006_BossBattleByName")

function GetActivityDungeon1006_BossBattleWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1006_BossBattleUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
