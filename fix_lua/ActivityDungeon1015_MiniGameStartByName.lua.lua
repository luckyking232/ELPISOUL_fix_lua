require("CommonResource_BackGroundByName")
require("ActivityDungeon1015_MiniStart_OperateRegionByName")
require("ActivityDungeon1015_MiniStart_IntegralByName")
require("ActivityDungeon1015_MiniStart_DirectionByName")

function GetActivityDungeon1015_MiniGameStartUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.OperateRegion = GetActivityDungeon1015_MiniStart_OperateRegionUis(ui:GetChild("OperateRegion"))
  uis.Integral = GetActivityDungeon1015_MiniStart_IntegralUis(ui:GetChild("Integral"))
  uis.MiniStart_Direction1 = GetActivityDungeon1015_MiniStart_DirectionUis(ui:GetChild("MiniStart_Direction1"))
  uis.MiniStart_JumpBtn1 = ui:GetChild("MiniStart_JumpBtn1")
  uis.MiniStart_Direction2 = GetActivityDungeon1015_MiniStart_DirectionUis(ui:GetChild("MiniStart_Direction2"))
  uis.MiniStart_JumpBtn2 = ui:GetChild("MiniStart_JumpBtn2")
  uis.FunctionDetailsBtn = ui:GetChild("FunctionDetailsBtn")
  uis.CloseBtn = ui:GetChild("CloseBtn")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
