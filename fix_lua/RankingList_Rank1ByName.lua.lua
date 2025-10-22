require("RankingList_RankNumberByName")
require("CommonResource_HeadByName")

function GetRankingList_Rank1Uis(ui)
  local uis = {}
  uis.Number = GetRankingList_RankNumberUis(ui:GetChild("Number"))
  uis.Head = GetCommonResource_HeadUis(ui:GetChild("Head"))
  uis.GulidIconLoader = ui:GetChild("GulidIconLoader")
  uis.typeCtr = ui:GetController("type")
  uis.root = ui
  return uis
end
