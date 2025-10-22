require("ActivityDungeon1003_ActivityDungeonByName")

function GetActivityDungeon1003_ActivityDungeonWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1003_ActivityDungeonUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
