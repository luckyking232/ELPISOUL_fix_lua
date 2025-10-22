require("CommonResource_BackGroundByName")
require("ActivityDungeon1004_MiniStart_IntegralByName")
require("ActivityDungeon1004_MiniStart_ConditionByName")
require("ActivityDungeon1004_MiniStart_LatticeRegionByName")

function GetActivityDungeon1004_MiniGameStartUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.Integral = GetActivityDungeon1004_MiniStart_IntegralUis(ui:GetChild("Integral"))
  uis.Condition = GetActivityDungeon1004_MiniStart_ConditionUis(ui:GetChild("Condition"))
  uis.LatticeRegion = GetActivityDungeon1004_MiniStart_LatticeRegionUis(ui:GetChild("LatticeRegion"))
  uis.CloseBtn = ui:GetChild("CloseBtn")
  uis.root = ui
  return uis
end
