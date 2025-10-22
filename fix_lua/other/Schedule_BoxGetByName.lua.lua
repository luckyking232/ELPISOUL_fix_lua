require("CommonResource_PopupBgByName")
require("Schedule_BoxGetTipsByName")

function GetSchedule_BoxGetUis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.BoxGetTips = GetSchedule_BoxGetTipsUis(ui:GetChild("BoxGetTips"))
  uis.root = ui
  return uis
end
