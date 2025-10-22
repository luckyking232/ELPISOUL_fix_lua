require("CommonResource_BackGroundByName")
require("ActivityDungeon1016_MiniStart_OperateRegionByName")
require("ActivityDungeon1016_MiniStart_IntegralByName")
require("ActivityDungeon1016_MiniStart_Tips1ByName")
require("ActivityDungeon1016_MiniStart_Tips2ByName")
require("ActivityDungeon1016_MiniStart_PreviewByName")

function GetActivityDungeon1016_MiniGameStartUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.OperateRegion = GetActivityDungeon1016_MiniStart_OperateRegionUis(ui:GetChild("OperateRegion"))
  uis.Integral = GetActivityDungeon1016_MiniStart_IntegralUis(ui:GetChild("Integral"))
  uis.Tips1 = GetActivityDungeon1016_MiniStart_Tips1Uis(ui:GetChild("Tips1"))
  uis.Tips2 = GetActivityDungeon1016_MiniStart_Tips2Uis(ui:GetChild("Tips2"))
  uis.Preview = GetActivityDungeon1016_MiniStart_PreviewUis(ui:GetChild("Preview"))
  uis.CloseBtn = ui:GetChild("CloseBtn")
  uis.root = ui
  return uis
end
