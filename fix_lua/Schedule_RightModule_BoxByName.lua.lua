require("Schedule_RightModuleProgressByName")
require("Schedule_RightModuleLockByName")
require("Schedule_RightModuleLoadingByName")

function GetSchedule_RightModule_BoxUis(ui)
  local uis = {}
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.Progress = GetSchedule_RightModuleProgressUis(ui:GetChild("Progress"))
  uis.Lock = GetSchedule_RightModuleLockUis(ui:GetChild("Lock"))
  uis.TouchBtn = ui:GetChild("TouchBtn")
  uis.GetBtn = ui:GetChild("GetBtn")
  uis.Loading = GetSchedule_RightModuleLoadingUis(ui:GetChild("Loading"))
  uis.lockCtr = ui:GetController("lock")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
