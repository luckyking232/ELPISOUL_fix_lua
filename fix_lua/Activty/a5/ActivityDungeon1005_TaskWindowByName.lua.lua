require("ActivityDungeon1005_TaskByName")

function GetActivityDungeon1005_TaskWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1005_TaskUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
