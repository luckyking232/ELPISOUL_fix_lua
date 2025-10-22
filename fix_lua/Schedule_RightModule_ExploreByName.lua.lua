require("Schedule_RightModuleTimeOpenByName")
require("Schedule_RightModuleLockByName")
require("Schedule_RightModuleLoadingByName")

function GetSchedule_RightModule_ExploreUis(ui)
  local uis = {}
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.TimeOpen = GetSchedule_RightModuleTimeOpenUis(ui:GetChild("TimeOpen"))
  uis.Lock = GetSchedule_RightModuleLockUis(ui:GetChild("Lock"))
  uis.StateList = ui:GetChild("StateList")
  uis.Loading = GetSchedule_RightModuleLoadingUis(ui:GetChild("Loading"))
  uis.lockCtr = ui:GetController("lock")
  uis.root = ui
  return uis
end
