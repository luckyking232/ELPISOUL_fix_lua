require("Abyss_ExploreFastItem2ByName")

function GetAbyss_ExploreFastItem2AniUis(ui)
  local uis = {}
  uis.Item = GetAbyss_ExploreFastItem2Uis(ui:GetChild("Item"))
  uis.root = ui
  return uis
end
