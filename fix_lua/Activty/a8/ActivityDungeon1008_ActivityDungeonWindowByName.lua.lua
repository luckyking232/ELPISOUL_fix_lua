require("ActivityDungeon1008_ActivityDungeonByName")

function GetActivityDungeon1008_ActivityDungeonWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1008_ActivityDungeonUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
