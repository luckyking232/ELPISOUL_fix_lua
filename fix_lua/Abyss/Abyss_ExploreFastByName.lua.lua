require("CommonResource_PopupBgByName")
require("Abyss_ExploreFastTipsByName")

function GetAbyss_ExploreFastUis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.Tips = GetAbyss_ExploreFastTipsUis(ui:GetChild("Tips"))
  uis.AssetsList = ui:GetChild("AssetsList")
  uis.root = ui
  return uis
end
