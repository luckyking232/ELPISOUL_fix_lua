require("CommonResource_HeadFrame_RByName")
require("CommonResource_BuildFrame_RByName")
require("CommonResource_GuildBossCardSignByName")

function GetCommonResource_AllFrame_R_BtnUis(ui)
  local uis = {}
  uis.HeadFrame_R = GetCommonResource_HeadFrame_RUis(ui:GetChild("HeadFrame_R"))
  uis.BuildFrame_R = GetCommonResource_BuildFrame_RUis(ui:GetChild("BuildFrame_R"))
  uis.GuildBossCardSign = GetCommonResource_GuildBossCardSignUis(ui:GetChild("GuildBossCardSign"))
  uis.buttonCtr = ui:GetController("button")
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.GuildBossCtr = ui:GetController("GuildBoss")
  uis.root = ui
  return uis
end
