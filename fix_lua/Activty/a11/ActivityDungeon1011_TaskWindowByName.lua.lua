require("ActivityDungeon1011_TaskByName")

function GetActivityDungeon1011_TaskWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1011_TaskUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
