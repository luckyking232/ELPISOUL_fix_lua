require("TowerSpecial_RewardItemListByName")

function GetTowerSpecial_RewardItemListAniUis(ui)
  local uis = {}
  uis.Item = GetTowerSpecial_RewardItemListUis(ui:GetChild("Item"))
  uis.root = ui
  return uis
end
