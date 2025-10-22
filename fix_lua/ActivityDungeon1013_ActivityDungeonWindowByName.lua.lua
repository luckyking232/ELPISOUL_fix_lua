require("ActivityDungeon1013_ActivityDungeonByName")

function GetActivityDungeon1013_ActivityDungeonWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1013_ActivityDungeonUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
