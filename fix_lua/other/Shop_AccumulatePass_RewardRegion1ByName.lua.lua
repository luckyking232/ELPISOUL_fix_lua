function GetShop_AccumulatePass_RewardRegion1Uis(ui)
  local uis = {}
  
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.WordNumberTxt = ui:GetChild("WordNumberTxt")
  uis.ItemList = ui:GetChild("ItemList")
  uis.Number1Txt = ui:GetChild("Number1Txt")
  uis.Number2Txt = ui:GetChild("Number2Txt")
  uis.Number3Txt = ui:GetChild("Number3Txt")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
