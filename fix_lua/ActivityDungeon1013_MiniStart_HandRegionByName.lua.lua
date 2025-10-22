function GetActivityDungeon1013_MiniStart_HandRegionUis(ui)
  local uis = {}
  
  uis.ExchangeBtn = ui:GetChild("ExchangeBtn")
  uis.LeftBtn = ui:GetChild("LeftBtn")
  uis.RightBtn = ui:GetChild("RightBtn")
  uis.ShootBtn = ui:GetChild("ShootBtn")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
