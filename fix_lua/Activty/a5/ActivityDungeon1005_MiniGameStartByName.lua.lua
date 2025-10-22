require("CommonResource_BackGroundByName")
require("ActivityDungeon1005_MiniStart_IntegralByName")
require("ActivityDungeon1005_MiniStart_OperateRegionByName")
require("ActivityDungeon1005_MiniStart_Info1ByName")
require("ActivityDungeon1005_MiniStart_Info2ByName")

function GetActivityDungeon1005_MiniGameStartUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.Integral = GetActivityDungeon1005_MiniStart_IntegralUis(ui:GetChild("Integral"))
  uis.OperateRegion = GetActivityDungeon1005_MiniStart_OperateRegionUis(ui:GetChild("OperateRegion"))
  uis.Info1 = GetActivityDungeon1005_MiniStart_Info1Uis(ui:GetChild("Info1"))
  uis.Info2 = GetActivityDungeon1005_MiniStart_Info2Uis(ui:GetChild("Info2"))
  uis.CloseBtn = ui:GetChild("CloseBtn")
  uis.root = ui
  return uis
end
