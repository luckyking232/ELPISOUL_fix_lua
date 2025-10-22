require("ActivityDungeon1019_ActivityDungeonByName")

function GetActivityDungeon1019_ActivityDungeonWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1019_ActivityDungeonUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
