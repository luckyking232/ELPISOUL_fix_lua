require("CommonResource_BackGroundByName")
require("TowerSpecial_BattleEventRegionByName")
require("TowerSpecial_SpecialProgressByName")
require("TowerSpecial_RecommendCardByName")
require("CommonResource_CurrencyReturnByName")

function GetTowerSpecial_TowerSpecialUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.BattleEventRegion = GetTowerSpecial_BattleEventRegionUis(ui:GetChild("BattleEventRegion"))
  uis.Progress = GetTowerSpecial_SpecialProgressUis(ui:GetChild("Progress"))
  uis.RecommendCard = GetTowerSpecial_RecommendCardUis(ui:GetChild("RecommendCard"))
  uis.RewardBtn = ui:GetChild("RewardBtn")
  uis.CurrencyReturn = GetCommonResource_CurrencyReturnUis(ui:GetChild("CurrencyReturn"))
  uis.root = ui
  return uis
end
