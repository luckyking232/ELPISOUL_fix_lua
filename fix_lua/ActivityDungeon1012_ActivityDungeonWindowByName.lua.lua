require("ActivityDungeon1012_ActivityDungeonByName")

function GetActivityDungeon1012_ActivityDungeonWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1012_ActivityDungeonUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
