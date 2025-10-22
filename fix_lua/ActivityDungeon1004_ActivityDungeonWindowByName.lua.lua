require("ActivityDungeon1004_ActivityDungeonByName")

function GetActivityDungeon1004_ActivityDungeonWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1004_ActivityDungeonUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
