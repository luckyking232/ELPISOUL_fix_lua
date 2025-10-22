require("ActivityDungeon1021_TaskByName")

function GetActivityDungeon1021_TaskWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1021_TaskUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
