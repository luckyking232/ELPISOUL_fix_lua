function GetTowerSpecial_BattleEventRegionUis(ui)
  local uis = {}
  
  uis.Effect1Holder = ui:GetChild("Effect1Holder")
  uis.Effect2Holder = ui:GetChild("Effect2Holder")
  uis.EventList = ui:GetChild("EventList")
  uis.root = ui
  return uis
end
