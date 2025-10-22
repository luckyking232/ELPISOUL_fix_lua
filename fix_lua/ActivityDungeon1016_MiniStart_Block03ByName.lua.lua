require("ActivityDungeon1016_MiniStart_BlockByName")

function GetActivityDungeon1016_MiniStart_Block03Uis(ui)
  local uis = {}
  uis.B1 = GetActivityDungeon1016_MiniStart_BlockUis(ui:GetChild("B1"))
  uis.B2 = GetActivityDungeon1016_MiniStart_BlockUis(ui:GetChild("B2"))
  uis.B3 = GetActivityDungeon1016_MiniStart_BlockUis(ui:GetChild("B3"))
  uis.B4 = GetActivityDungeon1016_MiniStart_BlockUis(ui:GetChild("B4"))
  uis.B5 = GetActivityDungeon1016_MiniStart_BlockUis(ui:GetChild("B5"))
  uis.root = ui
  return uis
end
