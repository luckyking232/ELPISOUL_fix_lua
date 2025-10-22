require("Guild_LevelTipsByName")
require("Guild_CloseTipsByName")
require("Guild_GuildBossRankByName")

function GetGuild_GuildTipsUis(ui)
  local uis = {}
  uis.LevelTxt = ui:GetChild("LevelTxt")
  uis.StageTxt = ui:GetChild("StageTxt")
  uis.StateTxt = ui:GetChild("StateTxt")
  uis.GulidIconLoader = ui:GetChild("GulidIconLoader")
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.LeaderNameTxt = ui:GetChild("LeaderNameTxt")
  uis.ApplyBtn = ui:GetChild("ApplyBtn")
  uis.LevelTips = GetGuild_LevelTipsUis(ui:GetChild("LevelTips"))
  uis.CloseTips = GetGuild_CloseTipsUis(ui:GetChild("CloseTips"))
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.PlayWordTxt = ui:GetChild("PlayWordTxt")
  uis.GuildBossRank = GetGuild_GuildBossRankUis(ui:GetChild("GuildBossRank"))
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.root = ui
  return uis
end
