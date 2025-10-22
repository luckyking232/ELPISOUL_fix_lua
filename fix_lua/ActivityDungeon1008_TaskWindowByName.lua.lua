require("ActivityDungeon1008_TaskByName")

function GetActivityDungeon1008_TaskWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1008_TaskUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
