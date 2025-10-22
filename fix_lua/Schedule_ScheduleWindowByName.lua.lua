require("Schedule_ScheduleByName")

function GetSchedule_ScheduleWindowUis(ui)
  local uis = {}
  uis.Main = GetSchedule_ScheduleUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
