function GetExploreDevelop_DevelopWearItemBtnUis(ui)
  local uis = {}
  
  uis.PicLoader = ui:GetChild("PicLoader")
  uis.EffectHolder = ui:GetChild("EffectHolder")
  uis.LevelTxt = ui:GetChild("LevelTxt")
  uis.AttributeTxt = ui:GetChild("AttributeTxt")
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.buttonCtr = ui:GetController("button")
  uis.c1Ctr = ui:GetController("c1")
  uis.colorCtr = ui:GetController("color")
  uis.root = ui
  return uis
end
