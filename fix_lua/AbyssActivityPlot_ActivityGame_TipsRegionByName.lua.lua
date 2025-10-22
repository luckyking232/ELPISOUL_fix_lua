require("AbyssActivityPlot_ActivityGame_TitleByName")

function GetAbyssActivityPlot_ActivityGame_TipsRegionUis(ui)
  local uis = {}
  uis.Title = GetAbyssActivityPlot_ActivityGame_TitleUis(ui:GetChild("Title"))
  uis.CloseBtn = ui:GetChild("CloseBtn")
  uis.TipsList = ui:GetChild("TipsList")
  uis.root = ui
  return uis
end
