function GetPlayerInfo_BirthdayUis(ui)
  local uis = {}
  
  uis.BirthdayTxt = ui:GetChild("BirthdayTxt")
  uis.TimeTxt = ui:GetChild("TimeTxt")
  uis.SetBtn = ui:GetChild("SetBtn")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
