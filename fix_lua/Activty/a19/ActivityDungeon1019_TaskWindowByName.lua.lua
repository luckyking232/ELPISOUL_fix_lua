require("ActivityDungeon1019_TaskByName")

function GetActivityDungeon1019_TaskWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1019_TaskUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
