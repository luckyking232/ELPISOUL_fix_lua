require("Abyss_ExploreLevelByName")
require("Abyss_BuildTipsLockByName")

function GetAbyss_ExploreRegionUis(ui)
  local uis = {}
  uis.ExploreLevel = GetAbyss_ExploreLevelUis(ui:GetChild("ExploreLevel"))
  uis.StateList = ui:GetChild("StateList")
  uis.GoBtn = ui:GetChild("GoBtn")
  uis.Lock = GetAbyss_BuildTipsLockUis(ui:GetChild("Lock"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
