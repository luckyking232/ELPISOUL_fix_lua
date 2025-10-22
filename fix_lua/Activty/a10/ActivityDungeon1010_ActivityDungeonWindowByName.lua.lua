require("ActivityDungeon1010_ActivityDungeonByName")

function GetActivityDungeon1010_ActivityDungeonWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1010_ActivityDungeonUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
