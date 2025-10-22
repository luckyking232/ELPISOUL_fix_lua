function GetExplore_AFKRewardInfoUis(ui)
  local uis = {}
  
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.ItemList = ui:GetChild("ItemList")
  uis.ShopBtn = ui:GetChild("ShopBtn")
  uis.root = ui
  return uis
end
