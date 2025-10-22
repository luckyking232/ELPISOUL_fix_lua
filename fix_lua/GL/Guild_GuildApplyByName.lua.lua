require("Guild_GuildEmptyByName")
require("Guild_Time1ByName")

function GetGuild_GuildApplyUis(ui)
  local uis = {}
  uis.GuildEmpty = GetGuild_GuildEmptyUis(ui:GetChild("GuildEmpty"))
  uis.GuildTipsList = ui:GetChild("GuildTipsList")
  uis.Time1 = GetGuild_Time1Uis(ui:GetChild("Time1"))
  uis.RefreshBtn = ui:GetChild("RefreshBtn")
  uis.JoinBtn = ui:GetChild("JoinBtn")
  uis.RecordBtn = ui:GetChild("RecordBtn")
  uis.EstablishBtn = ui:GetChild("EstablishBtn")
  uis.GuildFilterBtn = ui:GetChild("GuildFilterBtn")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
