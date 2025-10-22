require("BadgeOverview_WearStateByName")

function GetBadgeOverview_EffectUis(ui)
  local uis = {}
  uis.WearState = GetBadgeOverview_WearStateUis(ui:GetChild("WearState"))
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.EffectList = ui:GetChild("EffectList")
  uis.root = ui
  return uis
end
