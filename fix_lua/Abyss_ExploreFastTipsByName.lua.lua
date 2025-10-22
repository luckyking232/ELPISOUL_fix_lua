require("Abyss_ExploreFastSpend2ByName")

function GetAbyss_ExploreFastTipsUis(ui)
  local uis = {}
  uis.TitleTxt = ui:GetChild("TitleTxt")
  uis.BuyBtn = ui:GetChild("BuyBtn")
  uis.CloseBtn = ui:GetChild("CloseBtn")
  uis.Item1List = ui:GetChild("Item1List")
  uis.Item2List = ui:GetChild("Item2List")
  uis.Spend = GetAbyss_ExploreFastSpend2Uis(ui:GetChild("Spend"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
