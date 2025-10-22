require("CommonResource_BackGroundByName")
require("ActivityDungeon1008_MiniStart2_MapRegionByName")
require("ActivityDungeon1008_MiniStart2_IntegralByName")
require("ActivityDungeon1008_MiniStart_Joystick1ByName")
require("ActivityDungeon1008_MiniStart_Joystick3ByName")
require("ActivityDungeon1008_MiniStart_Joystick2ByName")
require("ActivityDungeon1008_MiniStart2_TipsWordByName")

function GetActivityDungeon1008_MiniGameStart2Uis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.MapRegion = GetActivityDungeon1008_MiniStart2_MapRegionUis(ui:GetChild("MapRegion"))
  uis.Integral = GetActivityDungeon1008_MiniStart2_IntegralUis(ui:GetChild("Integral"))
  uis.CloseBtn = ui:GetChild("CloseBtn")
  uis.SetBtn = ui:GetChild("SetBtn")
  uis.Joystick1Left = GetActivityDungeon1008_MiniStart_Joystick1Uis(ui:GetChild("Joystick1Left"))
  uis.Joystick2Right = GetActivityDungeon1008_MiniStart_Joystick1Uis(ui:GetChild("Joystick2Right"))
  uis.Joystick3Left = GetActivityDungeon1008_MiniStart_Joystick3Uis(ui:GetChild("Joystick3Left"))
  uis.Joystick3Right = GetActivityDungeon1008_MiniStart_Joystick2Uis(ui:GetChild("Joystick3Right"))
  uis.Joystick4Light = GetActivityDungeon1008_MiniStart_Joystick2Uis(ui:GetChild("Joystick4Light"))
  uis.Joystick4Right = GetActivityDungeon1008_MiniStart_Joystick3Uis(ui:GetChild("Joystick4Right"))
  uis.TipsWord = GetActivityDungeon1008_MiniStart2_TipsWordUis(ui:GetChild("TipsWord"))
  uis.joystickCtr = ui:GetController("joystick")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
