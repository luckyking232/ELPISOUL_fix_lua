require("ExploreDevelop_SealLevel_LevelRegionByName")
require("ExploreDevelop_SealForge_ForgeRegionByName")

function GetExploreDevelop_SealRegionUis(ui)
  local uis = {}
  uis.LevelRegion = GetExploreDevelop_SealLevel_LevelRegionUis(ui:GetChild("LevelRegion"))
  uis.ForgeRegion = GetExploreDevelop_SealForge_ForgeRegionUis(ui:GetChild("ForgeRegion"))
  uis.AssetsTipsList = ui:GetChild("AssetsTipsList")
  uis.TabList = ui:GetChild("TabList")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
