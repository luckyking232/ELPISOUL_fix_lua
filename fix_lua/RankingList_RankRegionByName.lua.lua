require("RankingList_Rank1ByName")
require("RankingList_Rank2ByName")
require("RankingList_Rank3ByName")

function GetRankingList_RankRegionUis(ui)
  local uis = {}
  uis.Rank1 = GetRankingList_Rank1Uis(ui:GetChild("Rank1"))
  uis.Rank2 = GetRankingList_Rank2Uis(ui:GetChild("Rank2"))
  uis.Rank3 = GetRankingList_Rank3Uis(ui:GetChild("Rank3"))
  uis.root = ui
  return uis
end
