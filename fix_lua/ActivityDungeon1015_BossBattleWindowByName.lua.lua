require("ActivityDungeon1015_BossBattleByName")

function GetActivityDungeon1015_BossBattleWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1015_BossBattleUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
