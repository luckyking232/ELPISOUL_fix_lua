require("TowerSpecial_RewardListByName")

function GetTowerSpecial_RewardListWindowUis(ui)
  local uis = {}
  uis.Main = GetTowerSpecial_RewardListUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
