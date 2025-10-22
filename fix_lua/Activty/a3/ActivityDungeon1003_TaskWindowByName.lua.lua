require("ActivityDungeon1003_TaskByName")

function GetActivityDungeon1003_TaskWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1003_TaskUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
