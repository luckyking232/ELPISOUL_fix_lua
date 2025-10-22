require("ActivityDungeon1008_NumberStripByName")
require("ActivityDungeon1008_BuyPriceNumberByName")

function GetActivityDungeon1008_BuyLevelDes1Uis(ui)
  local uis = {}
  uis.TitleTxt = ui:GetChild("TitleTxt")
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.ItemList = ui:GetChild("ItemList")
  uis.NumberStrip = GetActivityDungeon1008_NumberStripUis(ui:GetChild("NumberStrip"))
  uis.BuyPriceNumber = GetActivityDungeon1008_BuyPriceNumberUis(ui:GetChild("BuyPriceNumber"))
  uis.BuyLevelBtn = ui:GetChild("BuyLevelBtn")
  uis.root = ui
  return uis
end
