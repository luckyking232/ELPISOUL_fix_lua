require("ActivityDungeon1008_MiniStart_GateByName")

function GetActivityDungeon1008_MiniGame_Map08Uis(ui)
  local uis = {}
  uis.Gate = GetActivityDungeon1008_MiniStart_GateUis(ui:GetChild("Gate"))
  uis.root = ui
  return uis
end
