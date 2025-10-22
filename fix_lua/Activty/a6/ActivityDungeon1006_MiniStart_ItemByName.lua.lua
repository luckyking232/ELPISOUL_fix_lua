require("ActivityDungeon1006_MiniStart_Ani1ByName")
require("ActivityDungeon1006_MiniStart_Ani2ByName")

function GetActivityDungeon1006_MiniStart_ItemUis(ui)
  local uis = {}
  uis.Effect1Holder = ui:GetChild("Effect1Holder")
  uis.Effect2Holder = ui:GetChild("Effect2Holder")
  uis.Effect3Holder = ui:GetChild("Effect3Holder")
  uis.Ani1 = GetActivityDungeon1006_MiniStart_Ani1Uis(ui:GetChild("Ani1"))
  uis.Ani2 = GetActivityDungeon1006_MiniStart_Ani2Uis(ui:GetChild("Ani2"))
  uis.itemCtr = ui:GetController("item")
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.root = ui
  return uis
end
