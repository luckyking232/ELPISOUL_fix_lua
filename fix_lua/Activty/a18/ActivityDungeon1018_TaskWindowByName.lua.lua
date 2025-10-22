require("ActivityDungeon1018_TaskByName")

function GetActivityDungeon1018_TaskWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1018_TaskUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
