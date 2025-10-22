require("CommonResource_PopupBgByName")
require("Schedule_ScheduleTipsByName")

function GetSchedule_ScheduleUis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.ScheduleTips = GetSchedule_ScheduleTipsUis(ui:GetChild("ScheduleTips"))
  uis.root = ui
  return uis
end
