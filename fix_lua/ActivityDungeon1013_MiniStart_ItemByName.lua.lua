require("ActivityDungeon1013_MiniStart_ItemNumberByName")

function GetActivityDungeon1013_MiniStart_ItemUis(ui)
  local uis = {}
  uis.Effect1Holder = ui:GetChild("Effect1Holder")
  uis.ItemNumber = GetActivityDungeon1013_MiniStart_ItemNumberUis(ui:GetChild("ItemNumber"))
  uis.Effect2Holder = ui:GetChild("Effect2Holder")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
