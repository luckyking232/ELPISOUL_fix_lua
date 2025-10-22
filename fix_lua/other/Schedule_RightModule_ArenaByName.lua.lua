require("Schedule_RightModuleTimeCloseByName")
require("Schedule_RightModuleLockByName")
require("Schedule_RightModule_ArenaProgressByName")
require("Schedule_RightModule_ArenaRankByName")
require("Schedule_RightModuleRewardByName")
require("Schedule_RightModuleLoadingByName")

function GetSchedule_RightModule_ArenaUis(ui)
  local uis = {}
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.TimeClose = GetSchedule_RightModuleTimeCloseUis(ui:GetChild("TimeClose"))
  uis.Lock = GetSchedule_RightModuleLockUis(ui:GetChild("Lock"))
  uis.Progress = GetSchedule_RightModule_ArenaProgressUis(ui:GetChild("Progress"))
  uis.Rank = GetSchedule_RightModule_ArenaRankUis(ui:GetChild("Rank"))
  uis.Reward = GetSchedule_RightModuleRewardUis(ui:GetChild("Reward"))
  uis.Loading = GetSchedule_RightModuleLoadingUis(ui:GetChild("Loading"))
  uis.lockCtr = ui:GetController("lock")
  uis.rewardCtr = ui:GetController("reward")
  uis.root = ui
  return uis
end
