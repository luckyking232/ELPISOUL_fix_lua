require("ActivityDungeon1012_PassClothes_WordByName")
require("ActivityDungeon1012_PassClothes_CardQBByName")
require("ActivityDungeon1012_PassClothes_BuyRewardByName")

function GetActivityDungeon1012_PassClothes_ClothseRegionUis(ui)
  local uis = {}
  uis.Word = GetActivityDungeon1012_PassClothes_WordUis(ui:GetChild("Word"))
  uis.CardQB = GetActivityDungeon1012_PassClothes_CardQBUis(ui:GetChild("CardQB"))
  uis.BuyReward = GetActivityDungeon1012_PassClothes_BuyRewardUis(ui:GetChild("BuyReward"))
  uis.BuyBtn = ui:GetChild("BuyBtn")
  uis.root = ui
  return uis
end
