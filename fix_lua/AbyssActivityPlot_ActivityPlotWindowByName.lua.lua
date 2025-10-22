require("AbyssActivityPlot_ActivityPlotByName")

function GetAbyssActivityPlot_ActivityPlotWindowUis(ui)
  local uis = {}
  uis.Main = GetAbyssActivityPlot_ActivityPlotUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
