require("CommonResource_BackGroundByName")
require("TowerSpecial_TitleByName")

function GetTowerSpecial_RewardListUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.Title = GetTowerSpecial_TitleUis(ui:GetChild("Title"))
  uis.ItemList = ui:GetChild("ItemList")
  uis.ReturnBtn = ui:GetChild("ReturnBtn")
  uis.root = ui
  return uis
end
