require("Shop_GiftRechargeListByName")
require("Shop_FirstRechargeRegionByName")
require("Shop_PactCollectionByName")
require("Shop_AccumulatePassRegionByName")
require("Shop_LeftTabByName")

function GetShop_GiftUis(ui)
  local uis = {}
  uis.RechargeList = GetShop_GiftRechargeListUis(ui:GetChild("RechargeList"))
  uis.FirstRechargeRegion = GetShop_FirstRechargeRegionUis(ui:GetChild("FirstRechargeRegion"))
  uis.OneYuanPassRegion = GetShop_PactCollectionUis(ui:GetChild("OneYuanPassRegion"))
  uis.AccumulatePassRegion = GetShop_AccumulatePassRegionUis(ui:GetChild("AccumulatePassRegion"))
  uis.LeftTab = GetShop_LeftTabUis(ui:GetChild("LeftTab"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
