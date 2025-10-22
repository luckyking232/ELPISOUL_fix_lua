require("ActivityDungeon1018_MiniStart_DragBlockByName")

function GetActivityDungeon1018_MiniStart_LeftUis(ui)
  local uis = {}
  uis.LeftProgressBar = ui:GetChild("LeftProgressBar")
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.DragBlock = GetActivityDungeon1018_MiniStart_DragBlockUis(ui:GetChild("DragBlock"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
