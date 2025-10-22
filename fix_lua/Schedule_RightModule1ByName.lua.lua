require("Schedule_RightModuleTitleByName")

function GetSchedule_RightModule1Uis(ui)
  local uis = {}
  uis.Title = GetSchedule_RightModuleTitleUis(ui:GetChild("Title"))
  uis.ModuleList = ui:GetChild("ModuleList")
  uis.root = ui
  return uis
end
