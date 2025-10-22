require("CommonResource_PopupBgByName")
require("ExploreDevelop_SealLevelUpTipsByName")

function GetExploreDevelop_SealLevel_UpUpTipsUis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.LevelUpTipsContent = GetExploreDevelop_SealLevelUpTipsUis(ui:GetChild("LevelUpTipsContent"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.root = ui
  return uis
end
