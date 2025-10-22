require("ActivityDungeon1007_ActivityDungeonByName")

function GetActivityDungeon1007_ActivityDungeonWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1007_ActivityDungeonUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
