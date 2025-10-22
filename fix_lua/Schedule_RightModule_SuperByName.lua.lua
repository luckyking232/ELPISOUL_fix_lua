require("Schedule_RightModuleTimeOpenByName")
require("Schedule_RightModuleTimeCloseByName")
require("Schedule_RightModuleLockByName")
require("Schedule_RightModule_SuperProgressByName")
require("Schedule_RightModuleRewardByName")
require("Schedule_RightModuleLoadingByName")

function GetSchedule_RightModule_SuperUis(ui)
  local uis = {}
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.TimeOpen = GetSchedule_RightModuleTimeOpenUis(ui:GetChild("TimeOpen"))
  uis.TimeClose = GetSchedule_RightModuleTimeCloseUis(ui:GetChild("TimeClose"))
  uis.Lock = GetSchedule_RightModuleLockUis(ui:GetChild("Lock"))
  uis.Progress = GetSchedule_RightModule_SuperProgressUis(ui:GetChild("Progress"))
  uis.Reward = GetSchedule_RightModuleRewardUis(ui:GetChild("Reward"))
  uis.Loading = GetSchedule_RightModuleLoadingUis(ui:GetChild("Loading"))
  uis.lockCtr = ui:GetController("lock")
  uis.rewardCtr = ui:GetController("reward")
  uis.root = ui
  return uis
end
