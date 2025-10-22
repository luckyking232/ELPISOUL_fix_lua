require("Abyss_ExploreDungeonProgressByName")
require("Abyss_BuildTipsLockByName")

function GetAbyss_ExploreDungeonRegionUis(ui)
  local uis = {}
  uis.Progress = GetAbyss_ExploreDungeonProgressUis(ui:GetChild("Progress"))
  uis.GoBtn = ui:GetChild("GoBtn")
  uis.Lock = GetAbyss_BuildTipsLockUis(ui:GetChild("Lock"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
