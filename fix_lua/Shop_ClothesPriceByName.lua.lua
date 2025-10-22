require("Shop_ClothesPriceNumberByName")
require("Shop_ClothesCashPriceNumberByName")

function GetShop_ClothesPriceUis(ui)
  local uis = {}
  uis.Price = GetShop_ClothesPriceNumberUis(ui:GetChild("Price"))
  uis.CashPrice = GetShop_ClothesCashPriceNumberUis(ui:GetChild("CashPrice"))
  uis.SureBtn = ui:GetChild("SureBtn")
  uis.priceCtr = ui:GetController("price")
  uis.root = ui
  return uis
end
