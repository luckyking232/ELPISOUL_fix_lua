require("ActivityDungeon1011_MiniStart_BeadByName")

function GetActivityDungeon1011_MiniStart_LaunchUis(ui)
  local uis = {}
  uis.ArrowImage = ui:GetChild("ArrowImage")
  uis.Bead1 = GetActivityDungeon1011_MiniStart_BeadUis(ui:GetChild("Bead1"))
  uis.Bead2 = GetActivityDungeon1011_MiniStart_BeadUis(ui:GetChild("Bead2"))
  uis.SwitchBtn = ui:GetChild("SwitchBtn")
  uis.ItemList = ui:GetChild("ItemList")
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
