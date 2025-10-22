require("ActivityDungeon1016_TaskByName")

function GetActivityDungeon1016_TaskWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1016_TaskUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
