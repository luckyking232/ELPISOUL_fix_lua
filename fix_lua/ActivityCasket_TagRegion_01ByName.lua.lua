require("ActivityCasket_OrdinaryRewardTag_1010ByName")
require("ActivityCasket_OrdinaryRewardTag_1001ByName")
require("ActivityCasket_OrdinaryRewardTag_1002ByName")
require("ActivityCasket_OrdinaryRewardTag_1003ByName")
require("ActivityCasket_OrdinaryRewardTag_1004ByName")
require("ActivityCasket_OrdinaryRewardTag_1009ByName")
require("ActivityCasket_OrdinaryRewardTag_1008ByName")
require("ActivityCasket_OrdinaryRewardTag_1007ByName")
require("ActivityCasket_OrdinaryRewardTag_1006ByName")
require("ActivityCasket_OrdinaryRewardTag_1005ByName")

function GetActivityCasket_TagRegion_01Uis(ui)
  local uis = {}
  uis.Tag10 = GetActivityCasket_OrdinaryRewardTag_1010Uis(ui:GetChild("Tag10"))
  uis.Tag1 = GetActivityCasket_OrdinaryRewardTag_1001Uis(ui:GetChild("Tag1"))
  uis.Tag2 = GetActivityCasket_OrdinaryRewardTag_1002Uis(ui:GetChild("Tag2"))
  uis.Tag3 = GetActivityCasket_OrdinaryRewardTag_1003Uis(ui:GetChild("Tag3"))
  uis.Tag4 = GetActivityCasket_OrdinaryRewardTag_1004Uis(ui:GetChild("Tag4"))
  uis.Tag9 = GetActivityCasket_OrdinaryRewardTag_1009Uis(ui:GetChild("Tag9"))
  uis.Tag8 = GetActivityCasket_OrdinaryRewardTag_1008Uis(ui:GetChild("Tag8"))
  uis.Tag7 = GetActivityCasket_OrdinaryRewardTag_1007Uis(ui:GetChild("Tag7"))
  uis.Tag6 = GetActivityCasket_OrdinaryRewardTag_1006Uis(ui:GetChild("Tag6"))
  uis.Tag5 = GetActivityCasket_OrdinaryRewardTag_1005Uis(ui:GetChild("Tag5"))
  uis.root = ui
  return uis
end
