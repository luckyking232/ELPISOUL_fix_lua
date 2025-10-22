require("ActivityDungeon1010_PassClothes_WordByName")
require("ActivityDungeon1010_PassClothes_CardQBByName")
require("ActivityDungeon1010_PassClothes_BuyRewardByName")

function GetActivityDungeon1010_PassClothes_ClothseRegionUis(ui)
  local uis = {}
  uis.Word = GetActivityDungeon1010_PassClothes_WordUis(ui:GetChild("Word"))
  uis.CardQB = GetActivityDungeon1010_PassClothes_CardQBUis(ui:GetChild("CardQB"))
  uis.BuyReward = GetActivityDungeon1010_PassClothes_BuyRewardUis(ui:GetChild("BuyReward"))
  uis.BuyBtn = ui:GetChild("BuyBtn")
  uis.root = ui
  return uis
end
