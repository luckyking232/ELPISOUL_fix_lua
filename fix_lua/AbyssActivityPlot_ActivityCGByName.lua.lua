require("CommonResource_PopupBgByName")
require("AbyssActivityPlot_ActivityCG_TipsRegionByName")

function GetAbyssActivityPlot_ActivityCGUis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.TipsRegion = GetAbyssActivityPlot_ActivityCG_TipsRegionUis(ui:GetChild("TipsRegion"))
  uis.root = ui
  return uis
end
