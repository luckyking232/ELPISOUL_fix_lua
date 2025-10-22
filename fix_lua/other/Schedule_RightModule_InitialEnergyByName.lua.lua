require("Schedule_RightModule_InitialEnergyTimeByName")
require("Schedule_RightModuleLockByName")
require("Schedule_RightModule_InitialEnergyProgressByName")
require("Schedule_RightModuleLoadingByName")

function GetSchedule_RightModule_InitialEnergyUis(ui)
  local uis = {}
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.Time = GetSchedule_RightModule_InitialEnergyTimeUis(ui:GetChild("Time"))
  uis.Lock = GetSchedule_RightModuleLockUis(ui:GetChild("Lock"))
  uis.Progress = GetSchedule_RightModule_InitialEnergyProgressUis(ui:GetChild("Progress"))
  uis.TouchBtn = ui:GetChild("TouchBtn")
  uis.GetBtn = ui:GetChild("GetBtn")
  uis.Loading = GetSchedule_RightModuleLoadingUis(ui:GetChild("Loading"))
  uis.lockCtr = ui:GetController("lock")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
