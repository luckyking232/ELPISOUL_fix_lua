function GetSchedule_CycleDateUis(ui)
  local uis = {}
  
  uis.NowTxt = ui:GetChild("NowTxt")
  uis.DateTxt = ui:GetChild("DateTxt")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
