require("Shop_PactPass_ItemFrameByName")
require("Shop_PactPass_CardFrameByName")

function GetShop_PactPass_AllFrameUis(ui)
  local uis = {}
  uis.ItemFrame = GetShop_PactPass_ItemFrameUis(ui:GetChild("ItemFrame"))
  uis.CardFrame = GetShop_PactPass_CardFrameUis(ui:GetChild("CardFrame"))
  uis.Effect1Holder = ui:GetChild("Effect1Holder")
  uis.Effect2Holder = ui:GetChild("Effect2Holder")
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.root = ui
  return uis
end
