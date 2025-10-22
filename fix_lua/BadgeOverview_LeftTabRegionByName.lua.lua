function GetBadgeOverview_LeftTabRegionUis(ui)
  local uis = {}
  
  uis.OccupationList = ui:GetChild("OccupationList")
  uis.TeamList = ui:GetChild("TeamList")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
