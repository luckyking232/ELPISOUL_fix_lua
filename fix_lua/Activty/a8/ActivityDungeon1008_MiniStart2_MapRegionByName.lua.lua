require("ActivityDungeon1008_MiniStart2_MapLatticeByName")

function GetActivityDungeon1008_MiniStart2_MapRegionUis(ui)
  local uis = {}
  uis.MapLattice = GetActivityDungeon1008_MiniStart2_MapLatticeUis(ui:GetChild("MapLattice"))
  uis.root = ui
  return uis
end
