require("CommonResource_BackGroundByName")
require("ActivityCasket02_MapRegionByName")

function GetActivityCasket02_CasketUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.TopImage = ui:GetChild("TopImage")
  uis.BottomImage = ui:GetChild("BottomImage")
  uis.LeftImage = ui:GetChild("LeftImage")
  uis.RightImage = ui:GetChild("RightImage")
  uis.TagRegion = GetActivityCasket02_MapRegionUis(ui:GetChild("TagRegion"))
  uis.AssetsTipsList = ui:GetChild("AssetsTipsList")
  uis.GaChaBtn = ui:GetChild("GaChaBtn")
  uis.ShopBtn = ui:GetChild("ShopBtn")
  uis.RuleBtn = ui:GetChild("RuleBtn")
  uis.RecordBtn = ui:GetChild("RecordBtn")
  uis.ReturnBtn = ui:GetChild("ReturnBtn")
  uis.root = ui
  return uis
end
