require("CommonResource_PopupBgByName")
require("Raffle01_ExplainTipsRegionByName")

function GetRaffle01_ExplainTipsUis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.ExplainTips = GetRaffle01_ExplainTipsRegionUis(ui:GetChild("ExplainTips"))
  uis.root = ui
  return uis
end
