require("Schedule_CycleDateByName")

function GetSchedule_CycleDateRegionUis(ui)
  local uis = {}
  uis.CycleDate = GetSchedule_CycleDateUis(ui:GetChild("CycleDate"))
  uis.DateList = ui:GetChild("DateList")
  uis.root = ui
  return uis
end
