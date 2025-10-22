require("CommonResource_BackGroundByName")
require("Abyss_CycleShopByName")
require("Abyss_FixedShopByName")
require("Abyss_MaterialSellByName")
require("Abyss_ExploreShopByName")
require("CommonResource_CurrencyReturnByName")

function GetAbyss_ShopUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.TipsList = ui:GetChild("TipsList")
  uis.CycleShop = GetAbyss_CycleShopUis(ui:GetChild("CycleShop"))
  uis.FixedShop = GetAbyss_FixedShopUis(ui:GetChild("FixedShop"))
  uis.MaterialSell = GetAbyss_MaterialSellUis(ui:GetChild("MaterialSell"))
  uis.ExploreShop = GetAbyss_ExploreShopUis(ui:GetChild("ExploreShop"))
  uis.AssetsList = ui:GetChild("AssetsList")
  uis.CurrencyReturn = GetCommonResource_CurrencyReturnUis(ui:GetChild("CurrencyReturn"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
