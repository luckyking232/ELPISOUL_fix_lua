function GetActivityDungeon1011_MiniStart_HandRegionUis(ui)
  local uis = {}
  
  uis.LeftBtn = ui:GetChild("LeftBtn")
  uis.RightBtn = ui:GetChild("RightBtn")
  uis.ShootBtn = ui:GetChild("ShootBtn")
  uis.ExchangeBtn = ui:GetChild("ExchangeBtn")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
