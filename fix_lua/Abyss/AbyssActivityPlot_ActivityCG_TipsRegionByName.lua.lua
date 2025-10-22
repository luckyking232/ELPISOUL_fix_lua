require("AbyssActivityPlot_ActivityCG_TitleByName")

function GetAbyssActivityPlot_ActivityCG_TipsRegionUis(ui)
  local uis = {}
  uis.Title = GetAbyssActivityPlot_ActivityCG_TitleUis(ui:GetChild("Title"))
  uis.CloseBtn = ui:GetChild("CloseBtn")
  uis.TipsList = ui:GetChild("TipsList")
  uis.root = ui
  return uis
end
