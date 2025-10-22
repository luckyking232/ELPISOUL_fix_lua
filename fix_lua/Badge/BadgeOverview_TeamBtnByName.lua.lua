require("BadgeOverview_BgAniByName")

function GetBadgeOverview_TeamBtnUis(ui)
  local uis = {}
  uis.BgAni = GetBadgeOverview_BgAniUis(ui:GetChild("BgAni"))
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.buttonCtr = ui:GetController("button")
  uis.root = ui
  return uis
end
