require("ActivityDungeon1014_TaskByName")

function GetActivityDungeon1014_TaskWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1014_TaskUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
