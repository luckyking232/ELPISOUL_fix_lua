require("CommonResource_BackGroundByName")
require("ActivityDungeon1014_MiniStart_OperateRegionByName")
require("ActivityDungeon1014_MiniStart_IntegralByName")

function GetActivityDungeon1014_MiniGameStartUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.OperateRegion = GetActivityDungeon1014_MiniStart_OperateRegionUis(ui:GetChild("OperateRegion"))
  uis.Integral = GetActivityDungeon1014_MiniStart_IntegralUis(ui:GetChild("Integral"))
  uis.LeftBtn = ui:GetChild("LeftBtn")
  uis.RightBtn = ui:GetChild("RightBtn")
  uis.CloseBtn = ui:GetChild("CloseBtn")
  uis.root = ui
  return uis
end
