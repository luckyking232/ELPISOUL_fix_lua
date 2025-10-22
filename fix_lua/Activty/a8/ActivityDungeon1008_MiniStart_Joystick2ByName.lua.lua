require("ActivityDungeon1008_MiniStart_ArrowUpByName")
require("ActivityDungeon1008_MiniStart_ArrowDownByName")

function GetActivityDungeon1008_MiniStart_Joystick2Uis(ui)
  local uis = {}
  uis.Up = GetActivityDungeon1008_MiniStart_ArrowUpUis(ui:GetChild("Up"))
  uis.Down = GetActivityDungeon1008_MiniStart_ArrowDownUis(ui:GetChild("Down"))
  uis.root = ui
  return uis
end
