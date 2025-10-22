require("CommonResource_BackGroundByName")
require("ActivityDungeon1020_MiniStart_OperateRegionByName")
require("ActivityDungeon1020_MiniStart_IntegralByName")
require("ActivityDungeon1020_MiniStart_PreviewByName")

function GetActivityDungeon1020_MiniGameStartUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.OperateRegion = GetActivityDungeon1020_MiniStart_OperateRegionUis(ui:GetChild("OperateRegion"))
  uis.Integral = GetActivityDungeon1020_MiniStart_IntegralUis(ui:GetChild("Integral"))
  uis.Preview = GetActivityDungeon1020_MiniStart_PreviewUis(ui:GetChild("Preview"))
  uis.SwitchBtn = ui:GetChild("SwitchBtn")
  uis.CloseBtn = ui:GetChild("CloseBtn")
  uis.root = ui
  return uis
end
