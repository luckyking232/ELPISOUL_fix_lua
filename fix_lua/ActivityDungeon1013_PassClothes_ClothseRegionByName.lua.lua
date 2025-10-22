require("ActivityDungeon1013_PassClothes_WordByName")
require("ActivityDungeon1013_PassClothes_CardQBByName")
require("ActivityDungeon1013_PassClothes_BuyRewardByName")

function GetActivityDungeon1013_PassClothes_ClothseRegionUis(ui)
  local uis = {}
  uis.Word = GetActivityDungeon1013_PassClothes_WordUis(ui:GetChild("Word"))
  uis.CardQB = GetActivityDungeon1013_PassClothes_CardQBUis(ui:GetChild("CardQB"))
  uis.BuyReward = GetActivityDungeon1013_PassClothes_BuyRewardUis(ui:GetChild("BuyReward"))
  uis.BuyBtn = ui:GetChild("BuyBtn")
  uis.root = ui
  return uis
end
