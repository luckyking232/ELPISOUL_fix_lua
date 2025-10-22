function GetCard_CardCollectUis(ui)
  local uis = {}
  
  uis.ClearBtn = ui:GetChild("ClearBtn")
  uis.SaveBtn = ui:GetChild("SaveBtn")
  uis.CollectCtr = ui:GetController("Collect")
  uis.root = ui
  return uis
end
