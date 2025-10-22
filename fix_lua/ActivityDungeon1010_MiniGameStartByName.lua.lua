require("CommonResource_BackGroundByName")
require("ActivityDungeon1010_MiniStart_OperateRegionByName")
require("ActivityDungeon1010_MiniStart_IntegralByName")

function GetActivityDungeon1010_MiniGameStartUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.OperateRegion = GetActivityDungeon1010_MiniStart_OperateRegionUis(ui:GetChild("OperateRegion"))
  uis.TouchScreenBtn = ui:GetChild("TouchScreenBtn")
  uis.AssetsTipsList = ui:GetChild("AssetsTipsList")
  uis.Integral = GetActivityDungeon1010_MiniStart_IntegralUis(ui:GetChild("Integral"))
  uis.CloseBtn = ui:GetChild("CloseBtn")
  uis.FunctionDetailsBtn = ui:GetChild("FunctionDetailsBtn")
  uis.root = ui
  return uis
end
