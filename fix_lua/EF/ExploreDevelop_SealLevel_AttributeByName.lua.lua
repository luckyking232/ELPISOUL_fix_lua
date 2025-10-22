function GetExploreDevelop_SealLevel_AttributeUis(ui)
  local uis = {}
  
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.Number1Txt = ui:GetChild("Number1Txt")
  uis.Number2Txt = ui:GetChild("Number2Txt")
  uis.c1Ctr = ui:GetController("c1")
  uis.breachCtr = ui:GetController("breach")
  uis.root = ui
  return uis
end
