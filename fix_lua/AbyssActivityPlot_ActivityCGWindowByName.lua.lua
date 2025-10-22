require("AbyssActivityPlot_ActivityCGByName")

function GetAbyssActivityPlot_ActivityCGWindowUis(ui)
  local uis = {}
  uis.Main = GetAbyssActivityPlot_ActivityCGUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
