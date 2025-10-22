require("Shop_PactPass_ActivationByName")
require("Shop_PactPass_WordByName")
require("Shop_PactPass_ItemRegion1ByName")
require("Shop_PactPass_ItemRegion2ByName")

function GetShop_PactPassUis(ui)
  local uis = {}
  uis.Activation = GetShop_PactPass_ActivationUis(ui:GetChild("Activation"))
  uis.Word = GetShop_PactPass_WordUis(ui:GetChild("Word"))
  uis.GetBtn = ui:GetChild("GetBtn")
  uis.BuyBtn = ui:GetChild("BuyBtn")
  uis.Item1 = GetShop_PactPass_ItemRegion1Uis(ui:GetChild("Item1"))
  uis.Item2 = GetShop_PactPass_ItemRegion1Uis(ui:GetChild("Item2"))
  uis.Item3 = GetShop_PactPass_ItemRegion1Uis(ui:GetChild("Item3"))
  uis.Item4 = GetShop_PactPass_ItemRegion1Uis(ui:GetChild("Item4"))
  uis.Item5 = GetShop_PactPass_ItemRegion1Uis(ui:GetChild("Item5"))
  uis.Item6 = GetShop_PactPass_ItemRegion1Uis(ui:GetChild("Item6"))
  uis.Item7 = GetShop_PactPass_ItemRegion2Uis(ui:GetChild("Item7"))
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.root = ui
  return uis
end
