require("CommonResource_BackGroundByName")
require("ActivityDungeon1018_MiniStart_OperateRegionByName")
require("ActivityDungeon1018_MiniStart_IntegralByName")
require("ActivityDungeon1018_MiniStart_LeftByName")
require("ActivityDungeon1018_MiniStart_RightByName")

function GetActivityDungeon1018_MiniGameStartUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.OperateRegion = GetActivityDungeon1018_MiniStart_OperateRegionUis(ui:GetChild("OperateRegion"))
  uis.Integral = GetActivityDungeon1018_MiniStart_IntegralUis(ui:GetChild("Integral"))
  uis.Left = GetActivityDungeon1018_MiniStart_LeftUis(ui:GetChild("Left"))
  uis.Right = GetActivityDungeon1018_MiniStart_RightUis(ui:GetChild("Right"))
  uis.CloseBtn = ui:GetChild("CloseBtn")
  uis.root = ui
  return uis
end
