require("AbyssActivityPlot_ActivityPlotShop_SellOutByName")

function GetAbyssActivityPlot_ActivityPlotShop_ItemUis(ui)
  local uis = {}
  uis.ItemBtn = ui:GetChild("ItemBtn")
  uis.SellOut = GetAbyssActivityPlot_ActivityPlotShop_SellOutUis(ui:GetChild("SellOut"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
