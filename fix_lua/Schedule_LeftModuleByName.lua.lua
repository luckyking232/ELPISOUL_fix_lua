require("Schedule_LeftModulePicByName")
require("Schedule_LeftModuleTimeOpenByName")
require("Schedule_LeftModuleTimeCloseByName")
require("Schedule_LeftModuleLockByName")
require("Schedule_LeftModuleIngByName")
require("Schedule_LeftModule_GuildBossRankByName")
require("Schedule_RightModuleRewardByName")

function GetSchedule_LeftModuleUis(ui)
  local uis = {}
  uis.Pic = GetSchedule_LeftModulePicUis(ui:GetChild("Pic"))
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.TimeOpen = GetSchedule_LeftModuleTimeOpenUis(ui:GetChild("TimeOpen"))
  uis.TimeClose = GetSchedule_LeftModuleTimeCloseUis(ui:GetChild("TimeClose"))
  uis.Lock = GetSchedule_LeftModuleLockUis(ui:GetChild("Lock"))
  uis.Ing = GetSchedule_LeftModuleIngUis(ui:GetChild("Ing"))
  uis.Rank = GetSchedule_LeftModule_GuildBossRankUis(ui:GetChild("Rank"))
  uis.Reward = GetSchedule_RightModuleRewardUis(ui:GetChild("Reward"))
  uis.lockCtr = ui:GetController("lock")
  uis.GuildBossCtr = ui:GetController("GuildBoss")
  uis.rewardCtr = ui:GetController("reward")
  uis.root = ui
  return uis
end
