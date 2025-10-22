require("CommonResource_PopupBgByName")
require("CommonResource_Popup_BByName")
require("PlayerInfo_BirthdayTips_TimeRegionByName")

function GetPlayerInfo_BirthdayTipsUis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.Popup_B = GetCommonResource_Popup_BUis(ui:GetChild("Popup_B"))
  uis.Rename1 = GetPlayerInfo_BirthdayTips_TimeRegionUis(ui:GetChild("Rename1"))
  uis.root = ui
  return uis
end
