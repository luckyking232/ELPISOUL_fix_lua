function GetSchedule_AssetUis(ui)
  local uis = {}
  
  uis.AssetList = ui:GetChild("AssetList")
  uis.root = ui
  return uis
end
