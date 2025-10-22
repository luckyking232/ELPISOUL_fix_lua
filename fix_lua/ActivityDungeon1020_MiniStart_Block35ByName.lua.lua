require("ActivityDungeon1020_MiniStart_BlockByName")

function GetActivityDungeon1020_MiniStart_Block35Uis(ui)
  local uis = {}
  uis.B1 = GetActivityDungeon1020_MiniStart_BlockUis(ui:GetChild("B1"))
  uis.B2 = GetActivityDungeon1020_MiniStart_BlockUis(ui:GetChild("B2"))
  uis.B3 = GetActivityDungeon1020_MiniStart_BlockUis(ui:GetChild("B3"))
  uis.B4 = GetActivityDungeon1020_MiniStart_BlockUis(ui:GetChild("B4"))
  uis.B5 = GetActivityDungeon1020_MiniStart_BlockUis(ui:GetChild("B5"))
  uis.B6 = GetActivityDungeon1020_MiniStart_BlockUis(ui:GetChild("B6"))
  uis.root = ui
  return uis
end
