require("CommonResource_BackGroundByName")
require("CommonResource_CurrencyReturnByName")

function GetAbyssActivityPlot_ActivityPlotUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.TipsList = ui:GetChild("TipsList")
  uis.ShopBtn = ui:GetChild("ShopBtn")
  uis.CGBtn = ui:GetChild("CGBtn")
  uis.AssetsTipsList = ui:GetChild("AssetsTipsList")
  uis.CurrencyReturn = GetCommonResource_CurrencyReturnUis(ui:GetChild("CurrencyReturn"))
  uis.root = ui
  return uis
end
