function GetMultipleMaterials_FunctionUis(ui)
  local uis = {}
  
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.TimeTxt = ui:GetChild("TimeTxt")
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.GoBtn = ui:GetChild("GoBtn")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
