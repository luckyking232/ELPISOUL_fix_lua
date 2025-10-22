require("CommonResource_BackGroundByName")
require("ActivityDungeon1017_MiniStart_MapRegionByName")
require("ActivityDungeon1017_MiniStart_IntegralByName")
require("ActivityDungeon1017_MiniStart_InfoByName")
require("ActivityDungeon1017_MiniStart_JoystickByName")
require("ActivityDungeon1017_MiniStart_EffectTipsByName")

function GetActivityDungeon1017_MiniGameStartUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.MapRegion = GetActivityDungeon1017_MiniStart_MapRegionUis(ui:GetChild("MapRegion"))
  uis.Integral = GetActivityDungeon1017_MiniStart_IntegralUis(ui:GetChild("Integral"))
  uis.Info = GetActivityDungeon1017_MiniStart_InfoUis(ui:GetChild("Info"))
  uis.CloseBtn = ui:GetChild("CloseBtn")
  uis.JoystickLeft = GetActivityDungeon1017_MiniStart_JoystickUis(ui:GetChild("JoystickLeft"))
  uis.JoystickRight = GetActivityDungeon1017_MiniStart_JoystickUis(ui:GetChild("JoystickRight"))
  uis.EffectTips = GetActivityDungeon1017_MiniStart_EffectTipsUis(ui:GetChild("EffectTips"))
  uis.joystickCtr = ui:GetController("joystick")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
