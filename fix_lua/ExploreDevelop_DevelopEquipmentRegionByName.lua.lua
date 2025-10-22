require("ExploreDevelop_SealLevel_BreachByName")

function GetExploreDevelop_DevelopEquipmentRegionUis(ui)
  local uis = {}
  uis.Effect1Holder = ui:GetChild("Effect1Holder")
  uis.Effect2Holder = ui:GetChild("Effect2Holder")
  uis.Effect3Holder = ui:GetChild("Effect3Holder")
  uis.PopupCloseBtn = ui:GetChild("PopupCloseBtn")
  uis.Slot1Btn = ui:GetChild("Slot1Btn")
  uis.Slot2Btn = ui:GetChild("Slot2Btn")
  uis.Slot3Btn = ui:GetChild("Slot3Btn")
  uis.Breach = GetExploreDevelop_SealLevel_BreachUis(ui:GetChild("Breach"))
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.c3Ctr = ui:GetController("c3")
  uis.c4Ctr = ui:GetController("c4")
  uis.root = ui
  return uis
end
