require("ActivityDungeon1006_TaskByName")

function GetActivityDungeon1006_TaskWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1006_TaskUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
