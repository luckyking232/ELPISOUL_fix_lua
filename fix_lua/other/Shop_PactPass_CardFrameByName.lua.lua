require("Shop_PactPass_ItemCardPicByName")

function GetShop_PactPass_CardFrameUis(ui)
  local uis = {}
  uis.ItemCardPic = GetShop_PactPass_ItemCardPicUis(ui:GetChild("ItemCardPic"))
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.c3Ctr = ui:GetController("c3")
  uis.root = ui
  return uis
end
