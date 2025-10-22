function GetActivityDungeon1011_MiniStart_BeadUis(ui)
  local uis = {}
  
  uis.Effect1Holder = ui:GetChild("Effect1Holder")
  uis.Effect2Holder = ui:GetChild("Effect2Holder")
  uis.c1Ctr = ui:GetController("c1")
  uis.effectCtr = ui:GetController("effect")
  uis.root = ui
  return uis
end
