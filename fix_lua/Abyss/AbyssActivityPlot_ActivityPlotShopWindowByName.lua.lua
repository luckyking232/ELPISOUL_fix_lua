require("AbyssActivityPlot_ActivityPlotShopByName")

function GetAbyssActivityPlot_ActivityPlotShopWindowUis(ui)
  local uis = {}
  uis.Main = GetAbyssActivityPlot_ActivityPlotShopUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
