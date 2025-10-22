require("ActivityDungeon1017_ActivityDungeonByName")

function GetActivityDungeon1017_ActivityDungeonWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1017_ActivityDungeonUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
