function GetExploreDevelop_DevelopEquipmentSlotBtnUis(ui)
  local uis = {}
  
  uis.PicLoader = ui:GetChild("PicLoader")
  uis.EffectHolder = ui:GetChild("EffectHolder")
  uis.LevelTxt = ui:GetChild("LevelTxt")
  uis.buttonCtr = ui:GetController("button")
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.colorCtr = ui:GetController("color")
  uis.root = ui
  return uis
end
