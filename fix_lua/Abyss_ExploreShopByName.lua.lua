require("Abyss_ExploreShop_LeftTabByName")
require("Abyss_ExploreShop_ItemRegionByName")

function GetAbyss_ExploreShopUis(ui)
  local uis = {}
  uis.LeftTab = GetAbyss_ExploreShop_LeftTabUis(ui:GetChild("LeftTab"))
  uis.ItemRegion = GetAbyss_ExploreShop_ItemRegionUis(ui:GetChild("ItemRegion"))
  uis.QuickBtn = ui:GetChild("QuickBtn")
  uis.root = ui
  return uis
end
