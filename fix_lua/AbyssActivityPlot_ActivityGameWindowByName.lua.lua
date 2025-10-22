require("AbyssActivityPlot_ActivityGameByName")

function GetAbyssActivityPlot_ActivityGameWindowUis(ui)
  local uis = {}
  uis.Main = GetAbyssActivityPlot_ActivityGameUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
