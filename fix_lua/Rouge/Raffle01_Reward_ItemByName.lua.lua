require("CommonResource_ItemFrameByName")
require("Raffle01_Reward_MoveWordByName")
require("Raffle01_Reward_ProbabilityByName")
require("Raffle01_Reward_NumberLockByName")
require("Raffle01_Reward_GetWordByName")

function GetRaffle01_Reward_ItemUis(ui)
  local uis = {}
  uis.Item = GetCommonResource_ItemFrameUis(ui:GetChild("Item"))
  uis.MoveWord = GetRaffle01_Reward_MoveWordUis(ui:GetChild("MoveWord"))
  uis.Probability = GetRaffle01_Reward_ProbabilityUis(ui:GetChild("Probability"))
  uis.Lock = GetRaffle01_Reward_NumberLockUis(ui:GetChild("Lock"))
  uis.GetWord = GetRaffle01_Reward_GetWordUis(ui:GetChild("GetWord"))
  uis.c1Ctr = ui:GetController("c1")
  uis.typeCtr = ui:GetController("type")
  uis.c2Ctr = ui:GetController("c2")
  uis.root = ui
  return uis
end
