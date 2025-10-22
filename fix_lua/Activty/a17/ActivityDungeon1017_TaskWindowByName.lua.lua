require("ActivityDungeon1017_TaskByName")

function GetActivityDungeon1017_TaskWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1017_TaskUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
