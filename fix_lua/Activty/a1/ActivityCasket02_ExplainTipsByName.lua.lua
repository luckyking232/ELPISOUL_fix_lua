require("CommonResource_PopupBgByName")
require("ActivityCasket02_ExplainTipsRegionByName")

function GetActivityCasket02_ExplainTipsUis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.ExplainTips = GetActivityCasket02_ExplainTipsRegionUis(ui:GetChild("ExplainTips"))
  uis.root = ui
  return uis
end
