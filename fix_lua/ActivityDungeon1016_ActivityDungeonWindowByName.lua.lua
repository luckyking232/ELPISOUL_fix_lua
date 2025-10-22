require("ActivityDungeon1016_ActivityDungeonByName")

function GetActivityDungeon1016_ActivityDungeonWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1016_ActivityDungeonUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
