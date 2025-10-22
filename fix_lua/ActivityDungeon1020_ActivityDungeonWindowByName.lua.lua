require("ActivityDungeon1020_ActivityDungeonByName")

function GetActivityDungeon1020_ActivityDungeonWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1020_ActivityDungeonUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
