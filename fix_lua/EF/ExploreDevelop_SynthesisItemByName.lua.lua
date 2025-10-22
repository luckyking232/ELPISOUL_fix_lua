function GetExploreDevelop_SynthesisItemUis(ui)
  local uis = {}
  
  uis.PicLoader = ui:GetChild("PicLoader")
  uis.EffectHolder = ui:GetChild("EffectHolder")
  uis.LevelTxt = ui:GetChild("LevelTxt")
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.c1Ctr = ui:GetController("c1")
  uis.colorCtr = ui:GetController("color")
  uis.c2Ctr = ui:GetController("c2")
  uis.root = ui
  return uis
end
