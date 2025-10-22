require("CommonResource_BackGroundByName")
require("Raffle01_Raffle_TimeByName")
require("Raffle01_Task_ItemRegionByName")
require("Raffle01_BoxByName")
require("CommonResource_CurrencyReturnByName")

function GetRaffle01_RaffleUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.AssetsTipsList = ui:GetChild("AssetsTipsList")
  uis.TabList = ui:GetChild("TabList")
  uis.RewardList = ui:GetChild("RewardList")
  uis.Time = GetRaffle01_Raffle_TimeUis(ui:GetChild("Time"))
  uis.ItemRegion = GetRaffle01_Task_ItemRegionUis(ui:GetChild("ItemRegion"))
  uis.BoxBtn = GetRaffle01_BoxUis(ui:GetChild("BoxBtn"))
  uis.CurrencyReturn = GetCommonResource_CurrencyReturnUis(ui:GetChild("CurrencyReturn"))
  uis.root = ui
  return uis
end
