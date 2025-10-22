function GetPlayerReturns_LandRewardUis(ui)
  local uis = {}
  
  uis.TitleTxt = ui:GetChild("TitleTxt")
  uis.WordList = ui:GetChild("WordList")
  uis.ItemList = ui:GetChild("ItemList")
  uis.root = ui
  return uis
end
