require("AbyssActivityPlot_ActivityPlotTips1ByName")
require("AbyssActivityPlot_ActivityPlotTipsByName")

function GetAbyssActivityPlot_ActivityPlotTipsBtnUis(ui)
  local uis = {}
  uis.Tips1 = GetAbyssActivityPlot_ActivityPlotTips1Uis(ui:GetChild("Tips1"))
  uis.Tips = GetAbyssActivityPlot_ActivityPlotTipsUis(ui:GetChild("Tips"))
  uis.buttonCtr = ui:GetController("button")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
