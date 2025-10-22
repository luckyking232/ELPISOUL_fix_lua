require("CommonResource_PopupBgByName")
require("ActivityDungeon1015_MiniTips_RegionByName")

function GetActivityDungeon1015_MiniTipsUis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.Tips = GetActivityDungeon1015_MiniTips_RegionUis(ui:GetChild("Tips"))
  uis.root = ui
  return uis
end
