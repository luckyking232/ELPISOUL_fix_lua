require("ActivityDungeon1013_TaskByName")

function GetActivityDungeon1013_TaskWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1013_TaskUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
