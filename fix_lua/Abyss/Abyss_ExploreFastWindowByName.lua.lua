require("Abyss_ExploreFastByName")

function GetAbyss_ExploreFastWindowUis(ui)
  local uis = {}
  uis.Main = GetAbyss_ExploreFastUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
