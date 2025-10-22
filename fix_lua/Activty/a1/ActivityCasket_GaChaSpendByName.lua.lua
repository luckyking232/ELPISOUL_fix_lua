function GetActivityCasket_GaChaSpendUis(ui)
  local uis = {}
  
  uis.SpendTxt = ui:GetChild("SpendTxt")
  uis.ItemLoader = ui:GetChild("ItemLoader")
  uis.root = ui
  return uis
end
