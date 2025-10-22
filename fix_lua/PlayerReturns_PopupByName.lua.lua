require("CommonResource_PopupBgByName")
require("PlayerReturns_Popup_TipsByName")

function GetPlayerReturns_PopupUis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.Tips = GetPlayerReturns_Popup_TipsUis(ui:GetChild("Tips"))
  uis.root = ui
  return uis
end
