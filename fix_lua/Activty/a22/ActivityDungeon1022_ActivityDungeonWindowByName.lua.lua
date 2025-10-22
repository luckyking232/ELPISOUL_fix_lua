require("ActivityDungeon1022_ActivityDungeonByName")

function GetActivityDungeon1022_ActivityDungeonWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1022_ActivityDungeonUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
