require("Shop_AccumulatePass_RewardRegion2ByName")
require("Shop_AccumulatePass_WordByName")

function GetShop_AccumulatePassUis(ui)
  local uis = {}
  uis.RewardRegion2 = GetShop_AccumulatePass_RewardRegion2Uis(ui:GetChild("RewardRegion2"))
  uis.Word = GetShop_AccumulatePass_WordUis(ui:GetChild("Word"))
  uis.GetBtn = ui:GetChild("GetBtn")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
