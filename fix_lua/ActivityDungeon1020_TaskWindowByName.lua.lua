require("ActivityDungeon1020_TaskByName")

function GetActivityDungeon1020_TaskWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1020_TaskUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
