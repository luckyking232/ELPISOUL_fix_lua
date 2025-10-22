require("ActivityDungeon1014_ActivityDungeonByName")

function GetActivityDungeon1014_ActivityDungeonWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1014_ActivityDungeonUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
