require("BadgeOverview_BadgeOverviewByName")

function GetBadgeOverview_BadgeOverviewWindowUis(ui)
  local uis = {}
  uis.Main = GetBadgeOverview_BadgeOverviewUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
