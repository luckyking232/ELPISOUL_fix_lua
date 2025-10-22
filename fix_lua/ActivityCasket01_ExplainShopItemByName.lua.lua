function GetActivityCasket01_ExplainShopItemUis(ui)
  local uis = {}
  
  uis.PicLoader = ui:GetChild("PicLoader")
  uis.BuyNumberTxt = ui:GetChild("BuyNumberTxt")
  uis.PriceTxt = ui:GetChild("PriceTxt")
  uis.GroupNumberTxt = ui:GetChild("GroupNumberTxt")
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
