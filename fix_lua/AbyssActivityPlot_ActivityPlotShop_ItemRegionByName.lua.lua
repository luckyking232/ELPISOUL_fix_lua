require("AbyssActivityPlot_ActivityPlotShop_TitleByName")

function GetAbyssActivityPlot_ActivityPlotShop_ItemRegionUis(ui)
  local uis = {}
  uis.ShopTitle = GetAbyssActivityPlot_ActivityPlotShop_TitleUis(ui:GetChild("ShopTitle"))
  uis.ItemList = ui:GetChild("ItemList")
  uis.root = ui
  return uis
end
