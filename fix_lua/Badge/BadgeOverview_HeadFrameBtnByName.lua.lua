require("BadgeOverview_HeadFrameByName")

function GetBadgeOverview_HeadFrameBtnUis(ui)
  local uis = {}
  uis.HeadFrame = GetBadgeOverview_HeadFrameUis(ui:GetChild("HeadFrame"))
  uis.buttonCtr = ui:GetController("button")
  uis.root = ui
  return uis
end
