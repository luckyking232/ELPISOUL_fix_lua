require("PlayerReturns_Shop_ItemLockByName")

function GetPlayerReturns_Shop_ItemRegionUis(ui)
  local uis = {}
  uis.ItemList = ui:GetChild("ItemList")
  uis.ItemLock = GetPlayerReturns_Shop_ItemLockUis(ui:GetChild("ItemLock"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
