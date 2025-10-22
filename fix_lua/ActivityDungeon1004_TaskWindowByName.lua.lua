require("ActivityDungeon1004_TaskByName")

function GetActivityDungeon1004_TaskWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1004_TaskUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
