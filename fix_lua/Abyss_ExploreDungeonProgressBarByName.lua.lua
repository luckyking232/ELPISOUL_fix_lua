require("Abyss_ExploreDungeonProgressFillByName")

function GetAbyss_ExploreDungeonProgressBarUis(ui)
  local uis = {}
  uis.bar = GetAbyss_ExploreDungeonProgressFillUis(ui:GetChild("bar"))
  uis.ScaleHolder = ui:GetChild("ScaleHolder")
  uis.ScaleLoader = ui:GetChild("ScaleLoader")
  uis.root = ui
  return uis
end
