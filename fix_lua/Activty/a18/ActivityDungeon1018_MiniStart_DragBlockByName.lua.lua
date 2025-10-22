require("ActivityDungeon1018_MiniStart_BlockByName")

function GetActivityDungeon1018_MiniStart_DragBlockUis(ui)
  local uis = {}
  uis.Block1 = GetActivityDungeon1018_MiniStart_BlockUis(ui:GetChild("Block1"))
  uis.Block2 = GetActivityDungeon1018_MiniStart_BlockUis(ui:GetChild("Block2"))
  uis.Block3 = GetActivityDungeon1018_MiniStart_BlockUis(ui:GetChild("Block3"))
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.root = ui
  return uis
end
