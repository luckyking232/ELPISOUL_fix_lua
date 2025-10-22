require("CommonResource_BackGroundByName")
require("ActivityDungeon1006_MiniStart_IntegralByName")
require("ActivityDungeon1006_MiniStart_RegionByName")

function GetActivityDungeon1006_MiniGameStartUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.Integral = GetActivityDungeon1006_MiniStart_IntegralUis(ui:GetChild("Integral"))
  uis.CreateRegion = GetActivityDungeon1006_MiniStart_RegionUis(ui:GetChild("CreateRegion"))
  uis.ReturnBtn = ui:GetChild("ReturnBtn")
  uis.root = ui
  return uis
end
