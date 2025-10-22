require("BadgeOverview_Mark1ByName")
require("BadgeOverview_Mark2ByName")
require("BadgeOverview_Mark3ByName")

function GetBadgeOverview_WearStateUis(ui)
  local uis = {}
  uis.PicLoader = ui:GetChild("PicLoader")
  uis.Mark1 = GetBadgeOverview_Mark1Uis(ui:GetChild("Mark1"))
  uis.Mark2 = GetBadgeOverview_Mark2Uis(ui:GetChild("Mark2"))
  uis.Mark3 = GetBadgeOverview_Mark3Uis(ui:GetChild("Mark3"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
