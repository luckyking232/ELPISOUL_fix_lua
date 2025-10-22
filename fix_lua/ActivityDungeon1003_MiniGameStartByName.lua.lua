require("CommonResource_BackGroundByName")
require("ActivityDungeon1003_MiniStart_IntegralByName")
require("ActivityDungeon1003_MiniStart_CreateRegionByName")
require("ActivityDungeon1003_MiniStart_ClawRegionByName")
require("ActivityDungeon1003_MiniStart_ClawSpeedTipsByName")
require("ActivityDungeon1003_MiniStart_ClawGetIntegralByName")

function GetActivityDungeon1003_MiniGameStartUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.CloseBtn = ui:GetChild("CloseBtn")
  uis.SpeedList = ui:GetChild("SpeedList")
  uis.Integral = GetActivityDungeon1003_MiniStart_IntegralUis(ui:GetChild("Integral"))
  uis.CreateRegion = GetActivityDungeon1003_MiniStart_CreateRegionUis(ui:GetChild("CreateRegion"))
  uis.Claw = GetActivityDungeon1003_MiniStart_ClawRegionUis(ui:GetChild("Claw"))
  uis.SpeedTips = GetActivityDungeon1003_MiniStart_ClawSpeedTipsUis(ui:GetChild("SpeedTips"))
  uis.GetIntegral = GetActivityDungeon1003_MiniStart_ClawGetIntegralUis(ui:GetChild("GetIntegral"))
  uis.EffectHolder = ui:GetChild("EffectHolder")
  uis.root = ui
  return uis
end
