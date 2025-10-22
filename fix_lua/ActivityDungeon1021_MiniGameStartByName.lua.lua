require("CommonResource_BackGroundByName")
require("ActivityDungeon1021_MiniStart_OperateRegionByName")
require("ActivityDungeon1021_MiniStart_IntegralByName")
require("ActivityDungeon1021_MiniStart_PreviewRegionByName")

function GetActivityDungeon1021_MiniGameStartUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.OperateRegion = GetActivityDungeon1021_MiniStart_OperateRegionUis(ui:GetChild("OperateRegion"))
  uis.Integral = GetActivityDungeon1021_MiniStart_IntegralUis(ui:GetChild("Integral"))
  uis.LeftBtn = ui:GetChild("LeftBtn")
  uis.RightBtn = ui:GetChild("RightBtn")
  uis.DownBtn = ui:GetChild("DownBtn")
  uis.RotateBtn = ui:GetChild("RotateBtn")
  uis.PreviewRegion = GetActivityDungeon1021_MiniStart_PreviewRegionUis(ui:GetChild("PreviewRegion"))
  uis.CloseBtn = ui:GetChild("CloseBtn")
  uis.root = ui
  return uis
end
