require("Schedule_RightModuleLockByName")
require("Schedule_RightModuleLoadingByName")
require("Schedule_RightModule_ExploreDungeonProgressByName")

function GetSchedule_RightModule_ExploreDungeonUis(ui)
  local uis = {}
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.Lock = GetSchedule_RightModuleLockUis(ui:GetChild("Lock"))
  uis.Loading = GetSchedule_RightModuleLoadingUis(ui:GetChild("Loading"))
  uis.n11 = GetSchedule_RightModule_ExploreDungeonProgressUis(ui:GetChild("n11"))
  uis.GetBtn = ui:GetChild("GetBtn")
  uis.lockCtr = ui:GetController("lock")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
