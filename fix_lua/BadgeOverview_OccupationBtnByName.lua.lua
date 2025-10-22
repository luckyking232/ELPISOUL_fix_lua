require("BadgeOverview_BgAniByName")

function GetBadgeOverview_OccupationBtnUis(ui)
  local uis = {}
  uis.BgAni = GetBadgeOverview_BgAniUis(ui:GetChild("BgAni"))
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.buttonCtr = ui:GetController("button")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
