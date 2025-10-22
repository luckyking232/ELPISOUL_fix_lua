require("ActivityDungeon1012_TaskByName")

function GetActivityDungeon1012_TaskWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1012_TaskUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
