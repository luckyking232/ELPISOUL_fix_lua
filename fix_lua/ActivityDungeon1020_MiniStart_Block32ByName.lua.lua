require("ActivityDungeon1020_MiniStart_BlockByName")

function GetActivityDungeon1020_MiniStart_Block32Uis(ui)
  local uis = {}
  uis.B1 = GetActivityDungeon1020_MiniStart_BlockUis(ui:GetChild("B1"))
  uis.B2 = GetActivityDungeon1020_MiniStart_BlockUis(ui:GetChild("B2"))
  uis.root = ui
  return uis
end
