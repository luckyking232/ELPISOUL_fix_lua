require("ActivityDungeon1017_MiniStart_ArrowUpByName")
require("ActivityDungeon1017_MiniStart_ArrowDownByName")
require("ActivityDungeon1017_MiniStart_ArrowLeftByName")
require("ActivityDungeon1017_MiniStart_ArrowRightByName")

function GetActivityDungeon1017_MiniStart_JoystickUis(ui)
  local uis = {}
  uis.Up = GetActivityDungeon1017_MiniStart_ArrowUpUis(ui:GetChild("Up"))
  uis.Down = GetActivityDungeon1017_MiniStart_ArrowDownUis(ui:GetChild("Down"))
  uis.Left = GetActivityDungeon1017_MiniStart_ArrowLeftUis(ui:GetChild("Left"))
  uis.Right = GetActivityDungeon1017_MiniStart_ArrowRightUis(ui:GetChild("Right"))
  uis.root = ui
  return uis
end
