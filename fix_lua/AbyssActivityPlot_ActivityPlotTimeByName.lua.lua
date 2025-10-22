function GetAbyssActivityPlot_ActivityPlotTimeUis(ui)
  local uis = {}
  
  uis.TimeTxt = ui:GetChild("TimeTxt")
  uis.lockCtr = ui:GetController("lock")
  uis.root = ui
  return uis
end
