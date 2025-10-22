require("Schedule_BoxGetByName")

function GetSchedule_BoxGetWindowUis(ui)
  local uis = {}
  uis.Main = GetSchedule_BoxGetUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
