require("CommonResource_BackGroundByName")
require("ActivityDungeon1013_MiniStart2_IntegralByName")
require("ActivityDungeon1013_MiniStart2_OperateRegionByName")

function GetActivityDungeon1013_MiniGameStart2Uis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.Integral = GetActivityDungeon1013_MiniStart2_IntegralUis(ui:GetChild("Integral"))
  uis.OperateRegion = GetActivityDungeon1013_MiniStart2_OperateRegionUis(ui:GetChild("OperateRegion"))
  uis.WithdrawBtn = ui:GetChild("WithdrawBtn")
  uis.AgainBtn = ui:GetChild("AgainBtn")
  uis.PauseBtn = ui:GetChild("PauseBtn")
  uis.CloseBtn = ui:GetChild("CloseBtn")
  uis.root = ui
  return uis
end
