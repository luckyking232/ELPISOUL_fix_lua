require("PlayerReturns_Shop_TokenRegionByName")

function GetPlayerReturns_ShopUis(ui)
  local uis = {}
  uis.TokenRegion = GetPlayerReturns_Shop_TokenRegionUis(ui:GetChild("TokenRegion"))
  uis.ItemRegionList = ui:GetChild("ItemRegionList")
  uis.GetBtn = ui:GetChild("GetBtn")
  uis.root = ui
  return uis
end
