require("ActivityDungeon1005_ActivityDungeonByName")

function GetActivityDungeon1005_ActivityDungeonWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1005_ActivityDungeonUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
