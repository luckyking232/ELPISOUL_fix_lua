require("AbyssActivityPlot_ActivityPlotShop_CardHeadBgByName")
require("AbyssActivityPlot_ActivityPlotShop_ItemNumberByName")
require("AbyssActivityPlot_ActivityPlotShop_UseMarkByName")

function GetAbyssActivityPlot_ActivityPlotShop_ItemBtnUis(ui)
  local uis = {}
  uis.CardHeadBg = GetAbyssActivityPlot_ActivityPlotShop_CardHeadBgUis(ui:GetChild("CardHeadBg"))
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.ItemLoader = ui:GetChild("ItemLoader")
  uis.ItemNumber = GetAbyssActivityPlot_ActivityPlotShop_ItemNumberUis(ui:GetChild("ItemNumber"))
  uis.SpendLoader = ui:GetChild("SpendLoader")
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.UseMark = GetAbyssActivityPlot_ActivityPlotShop_UseMarkUis(ui:GetChild("UseMark"))
  uis.StarList = ui:GetChild("StarList")
  uis.buttonCtr = ui:GetController("button")
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.c3Ctr = ui:GetController("c3")
  uis.c4Ctr = ui:GetController("c4")
  uis.c5Ctr = ui:GetController("c5")
  uis.root = ui
  return uis
end
