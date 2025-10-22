require("CommonResource_BackGroundByName")
require("BadgeOverview_LeftTabRegionByName")
require("BadgeOverview_TopTabRegionByName")
require("BadgeOverview_AttributeRegionByName")
require("BadgeOverview_EffectRegionByName")
require("BadgeOverview_CardEmptyByName")

function GetBadgeOverview_BadgeOverviewUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.LeftTabRegion = GetBadgeOverview_LeftTabRegionUis(ui:GetChild("LeftTabRegion"))
  uis.TopTabRegion = GetBadgeOverview_TopTabRegionUis(ui:GetChild("TopTabRegion"))
  uis.AttributeRegion = GetBadgeOverview_AttributeRegionUis(ui:GetChild("AttributeRegion"))
  uis.EffectRegion = GetBadgeOverview_EffectRegionUis(ui:GetChild("EffectRegion"))
  uis.CardEmpty = GetBadgeOverview_CardEmptyUis(ui:GetChild("CardEmpty"))
  uis.CardList = ui:GetChild("CardList")
  uis.AllWearBtn = ui:GetChild("AllWearBtn")
  uis.RecommendWearBtn = ui:GetChild("RecommendWearBtn")
  uis.GoWearBtn = ui:GetChild("GoWearBtn")
  uis.StateBtn = ui:GetChild("StateBtn")
  uis.CloseBtn = ui:GetChild("CloseBtn")
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.root = ui
  return uis
end
