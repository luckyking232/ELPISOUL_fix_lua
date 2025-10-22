require("ActivityDungeon1008_MiniStart_ArrowLeftByName")
require("ActivityDungeon1008_MiniStart_ArrowRightByName")

function GetActivityDungeon1008_MiniStart_Joystick3Uis(ui)
  local uis = {}
  uis.Left = GetActivityDungeon1008_MiniStart_ArrowLeftUis(ui:GetChild("Left"))
  uis.Right = GetActivityDungeon1008_MiniStart_ArrowRightUis(ui:GetChild("Right"))
  uis.root = ui
  return uis
end
