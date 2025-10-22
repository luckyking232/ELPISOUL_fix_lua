require("AbyssActivityPlot_ActivityPlotTimeByName")
require("AbyssActivityPlot_ActivityPlotLockByName")

function GetAbyssActivityPlot_ActivityPlotTipsUis(ui)
  local uis = {}
  uis.PicLoader = ui:GetChild("PicLoader")
  uis.Time = GetAbyssActivityPlot_ActivityPlotTimeUis(ui:GetChild("Time"))
  uis.Lock = GetAbyssActivityPlot_ActivityPlotLockUis(ui:GetChild("Lock"))
  uis.lcokCtr = ui:GetController("lcok")
  uis.newCtr = ui:GetController("new")
  uis.root = ui
  return uis
end
