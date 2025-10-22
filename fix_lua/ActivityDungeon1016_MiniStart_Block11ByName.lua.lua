require("ActivityDungeon1016_MiniStart_BlockByName")

function GetActivityDungeon1016_MiniStart_Block11Uis(ui)
  local uis = {}
  uis.B1 = GetActivityDungeon1016_MiniStart_BlockUis(ui:GetChild("B1"))
  uis.B2 = GetActivityDungeon1016_MiniStart_BlockUis(ui:GetChild("B2"))
  uis.root = ui
  return uis
end
