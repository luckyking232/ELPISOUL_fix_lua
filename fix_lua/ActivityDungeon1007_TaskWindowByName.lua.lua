require("ActivityDungeon1007_TaskByName")

function GetActivityDungeon1007_TaskWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1007_TaskUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
