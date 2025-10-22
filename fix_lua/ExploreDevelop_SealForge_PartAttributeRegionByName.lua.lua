function GetExploreDevelop_SealForge_PartAttributeRegionUis(ui)
  local uis = {}
  
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.PartAttributeList = ui:GetChild("PartAttributeList")
  uis.lockCtr = ui:GetController("lock")
  uis.root = ui
  return uis
end
