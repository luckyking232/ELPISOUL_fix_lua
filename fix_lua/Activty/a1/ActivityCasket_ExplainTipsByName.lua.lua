require("CommonResource_PopupBgByName")
require("ActivityCasket_ExplainTipsRegionByName")

function GetActivityCasket_ExplainTipsUis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.ExplainTips = GetActivityCasket_ExplainTipsRegionUis(ui:GetChild("ExplainTips"))
  uis.root = ui
  return uis
end
