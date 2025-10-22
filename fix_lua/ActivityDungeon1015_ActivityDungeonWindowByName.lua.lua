require("ActivityDungeon1015_ActivityDungeonByName")

function GetActivityDungeon1015_ActivityDungeonWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1015_ActivityDungeonUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
