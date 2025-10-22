require("CommonResource_BackGroundByName")
require("CommonResource_CurrencyReturnByName")

function GetAbyssActivityPlot_ActivityPlotShopUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.AssetsTipsList = ui:GetChild("AssetsTipsList")
  uis.ItemList = ui:GetChild("ItemList")
  uis.CurrencyReturn = GetCommonResource_CurrencyReturnUis(ui:GetChild("CurrencyReturn"))
  uis.root = ui
  return uis
end
