require("ActivityCasket_ExplainTips1ByName")
require("ActivityCasket_ExplainTips2ByName")
require("ActivityCasket_ExplainTips4ByName")

function GetActivityCasket_ExplainTipsRegionUis(ui)
  local uis = {}
  uis.ExplainTips1 = GetActivityCasket_ExplainTips1Uis(ui:GetChild("ExplainTips1"))
  uis.ExplainTips2 = GetActivityCasket_ExplainTips2Uis(ui:GetChild("ExplainTips2"))
  uis.ExplainTips3 = GetActivityCasket_ExplainTips4Uis(ui:GetChild("ExplainTips3"))
  uis.BurstTab1Btn = ui:GetChild("BurstTab1Btn")
  uis.BurstTab2Btn = ui:GetChild("BurstTab2Btn")
  uis.BurstTab3Btn = ui:GetChild("BurstTab3Btn")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
