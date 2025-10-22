require("CommonResource_PopupBgByName")
require("CommonResource_Popup_OpalByName")
require("Card_QuickStarUpTips1ByName")

function GetCard_QuickStarUpTips2Uis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.Popup_Opal = GetCommonResource_Popup_OpalUis(ui:GetChild("Popup_Opal"))
  uis.Tips1 = GetCard_QuickStarUpTips1Uis(ui:GetChild("Tips1"))
  uis.root = ui
  return uis
end
