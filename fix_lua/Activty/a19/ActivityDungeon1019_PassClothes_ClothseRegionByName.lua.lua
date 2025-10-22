require("ActivityDungeon1019_PassClothes_WordByName")
require("ActivityDungeon1019_PassClothes_CardQBByName")
require("ActivityDungeon1019_PassClothes_BuyRewardByName")

function GetActivityDungeon1019_PassClothes_ClothseRegionUis(ui)
  local uis = {}
  uis.Word = GetActivityDungeon1019_PassClothes_WordUis(ui:GetChild("Word"))
  uis.CardQB = GetActivityDungeon1019_PassClothes_CardQBUis(ui:GetChild("CardQB"))
  uis.BuyReward = GetActivityDungeon1019_PassClothes_BuyRewardUis(ui:GetChild("BuyReward"))
  uis.BuyBtn = ui:GetChild("BuyBtn")
  uis.root = ui
  return uis
end
