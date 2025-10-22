require("AbyssActivityPlot_ActivityPlotShop_ItemByName")

function GetAbyssActivityPlot_ActivityPlotShop_ItemAniUis(ui)
  local uis = {}
  uis.Item = GetAbyssActivityPlot_ActivityPlotShop_ItemUis(ui:GetChild("Item"))
  uis.root = ui
  return uis
end
