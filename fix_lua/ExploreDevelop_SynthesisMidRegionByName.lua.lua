function GetExploreDevelop_SynthesisMidRegionUis(ui)
  local uis = {}
  
  uis.Slot1Btn = ui:GetChild("Slot1Btn")
  uis.Slot2Btn = ui:GetChild("Slot2Btn")
  uis.Slot3Btn = ui:GetChild("Slot3Btn")
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.root = ui
  return uis
end
