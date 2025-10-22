require("ActivityDungeon1011_ActivityDungeonByName")

function GetActivityDungeon1011_ActivityDungeonWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1011_ActivityDungeonUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
