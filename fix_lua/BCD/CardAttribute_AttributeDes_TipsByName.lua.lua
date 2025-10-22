function GetCardAttribute_AttributeDes_TipsUis(ui)
  local uis = {}
  
  uis.Type1List = ui:GetChild("Type1List")
  uis.Type2List = ui:GetChild("Type2List")
  uis.CardAttributeList = ui:GetChild("CardAttributeList")
  uis.ChoiceBtn = ui:GetChild("ChoiceBtn")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
