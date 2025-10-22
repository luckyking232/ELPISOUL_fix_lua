require("ActivityDungeon1018_ActivityDungeonByName")

function GetActivityDungeon1018_ActivityDungeonWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1018_ActivityDungeonUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
