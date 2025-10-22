require("ActivityDungeon1020_MiniStart_BlockByName")

function GetActivityDungeon1020_MiniStart_Block31Uis(ui)
  local uis = {}
  uis.B1 = GetActivityDungeon1020_MiniStart_BlockUis(ui:GetChild("B1"))
  uis.B2 = GetActivityDungeon1020_MiniStart_BlockUis(ui:GetChild("B2"))
  uis.B3 = GetActivityDungeon1020_MiniStart_BlockUis(ui:GetChild("B3"))
  uis.root = ui
  return uis
end
