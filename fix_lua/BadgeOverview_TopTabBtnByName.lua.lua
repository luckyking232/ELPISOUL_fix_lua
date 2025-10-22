require("BadgeOverview_TopTabBtnBgByName")

function GetBadgeOverview_TopTabBtnUis(ui)
  local uis = {}
  uis.MaterialTabBtnBg = GetBadgeOverview_TopTabBtnBgUis(ui:GetChild("MaterialTabBtnBg"))
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.buttonCtr = ui:GetController("button")
  uis.root = ui
  return uis
end
