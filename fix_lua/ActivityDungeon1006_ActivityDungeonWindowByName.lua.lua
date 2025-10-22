require("ActivityDungeon1006_ActivityDungeonByName")

function GetActivityDungeon1006_ActivityDungeonWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1006_ActivityDungeonUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
