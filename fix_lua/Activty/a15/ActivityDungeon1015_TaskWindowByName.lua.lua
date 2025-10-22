require("ActivityDungeon1015_TaskByName")

function GetActivityDungeon1015_TaskWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1015_TaskUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
