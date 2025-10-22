require("CommonResource_BackGroundByName")
require("PlayerReturns_LandRewardByName")
require("PlayerReturns_SignRewardByName")
require("PlayerReturns_MultipleByName")
require("PlayerReturns_ShopByName")
require("PlayerReturns_TabRegionByName")
require("CommonResource_CurrencyReturnByName")

function GetPlayerReturns_PlayerReturnsUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.LandReward = GetPlayerReturns_LandRewardUis(ui:GetChild("LandReward"))
  uis.SignReward = GetPlayerReturns_SignRewardUis(ui:GetChild("SignReward"))
  uis.Multiple = GetPlayerReturns_MultipleUis(ui:GetChild("Multiple"))
  uis.Shop = GetPlayerReturns_ShopUis(ui:GetChild("Shop"))
  uis.TabRegion = GetPlayerReturns_TabRegionUis(ui:GetChild("TabRegion"))
  uis.AssetsTipsList = ui:GetChild("AssetsTipsList")
  uis.CurrencyReturn = GetCommonResource_CurrencyReturnUis(ui:GetChild("CurrencyReturn"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
