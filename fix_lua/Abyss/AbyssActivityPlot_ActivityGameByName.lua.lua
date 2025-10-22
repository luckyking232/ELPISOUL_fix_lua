require("CommonResource_PopupBgByName")
require("AbyssActivityPlot_ActivityGame_TipsRegionByName")

function GetAbyssActivityPlot_ActivityGameUis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.TipsRegion = GetAbyssActivityPlot_ActivityGame_TipsRegionUis(ui:GetChild("TipsRegion"))
  uis.root = ui
  return uis
end
