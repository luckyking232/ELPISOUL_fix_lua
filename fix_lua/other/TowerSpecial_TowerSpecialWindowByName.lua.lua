require("TowerSpecial_TowerSpecialByName")

function GetTowerSpecial_TowerSpecialWindowUis(ui)
  local uis = {}
  uis.Main = GetTowerSpecial_TowerSpecialUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
