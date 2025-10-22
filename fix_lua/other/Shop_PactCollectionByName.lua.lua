require("Shop_OneYuanPassRegionByName")
require("Shop_PactPassRegionByName")

function GetShop_PactCollectionUis(ui)
  local uis = {}
  uis.OneYuanPass = GetShop_OneYuanPassRegionUis(ui:GetChild("OneYuanPass"))
  uis.PactPass = GetShop_PactPassRegionUis(ui:GetChild("PactPass"))
  uis.TabList = ui:GetChild("TabList")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
