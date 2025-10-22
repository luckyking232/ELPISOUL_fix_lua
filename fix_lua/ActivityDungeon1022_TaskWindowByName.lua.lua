require("ActivityDungeon1022_TaskByName")

function GetActivityDungeon1022_TaskWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1022_TaskUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
