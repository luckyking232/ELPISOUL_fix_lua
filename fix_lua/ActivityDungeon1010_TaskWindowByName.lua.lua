require("ActivityDungeon1010_TaskByName")

function GetActivityDungeon1010_TaskWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1010_TaskUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
