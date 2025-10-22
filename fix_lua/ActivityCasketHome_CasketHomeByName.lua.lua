require("CommonResource_PopupBgByName")
require("ActivityCasketHome_TipsByName")

function GetActivityCasketHome_CasketHomeUis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.Tips = GetActivityCasketHome_TipsUis(ui:GetChild("Tips"))
  uis.root = ui
  return uis
end
