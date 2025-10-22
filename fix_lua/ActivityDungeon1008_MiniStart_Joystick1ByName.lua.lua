require("ActivityDungeon1008_MiniStart_ArrowUpByName")
require("ActivityDungeon1008_MiniStart_ArrowDownByName")
require("ActivityDungeon1008_MiniStart_ArrowLeftByName")
require("ActivityDungeon1008_MiniStart_ArrowRightByName")

function GetActivityDungeon1008_MiniStart_Joystick1Uis(ui)
  local uis = {}
  uis.Up = GetActivityDungeon1008_MiniStart_ArrowUpUis(ui:GetChild("Up"))
  uis.Down = GetActivityDungeon1008_MiniStart_ArrowDownUis(ui:GetChild("Down"))
  uis.Left = GetActivityDungeon1008_MiniStart_ArrowLeftUis(ui:GetChild("Left"))
  uis.Right = GetActivityDungeon1008_MiniStart_ArrowRightUis(ui:GetChild("Right"))
  uis.root = ui
  return uis
end
