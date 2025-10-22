require("ActivityDungeon1021_ActivityDungeonByName")

function GetActivityDungeon1021_ActivityDungeonWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1021_ActivityDungeonUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
