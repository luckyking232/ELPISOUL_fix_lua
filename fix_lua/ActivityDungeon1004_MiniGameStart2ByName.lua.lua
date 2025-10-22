require("CommonResource_BackGroundByName")
require("ActivityDungeon1004_MiniStart2_TopRegionByName")
require("ActivityDungeon1004_MiniStart2_StageRegionByName")

function GetActivityDungeon1004_MiniGameStart2Uis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.TopRegion = GetActivityDungeon1004_MiniStart2_TopRegionUis(ui:GetChild("TopRegion"))
  uis.StageRegion = GetActivityDungeon1004_MiniStart2_StageRegionUis(ui:GetChild("StageRegion"))
  uis.EffectHolder = ui:GetChild("EffectHolder")
  uis.Effect1Holder = ui:GetChild("Effect1Holder")
  uis.Effect2Holder = ui:GetChild("Effect2Holder")
  uis.Effect3Holder = ui:GetChild("Effect3Holder")
  uis.CloseBtn = ui:GetChild("CloseBtn")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
