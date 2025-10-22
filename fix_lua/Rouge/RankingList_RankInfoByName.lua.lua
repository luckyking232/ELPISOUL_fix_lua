require("RankingList_RankInfo1ByName")

function GetRankingList_RankInfoUis(ui)
  local uis = {}
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.Info1 = GetRankingList_RankInfo1Uis(ui:GetChild("Info1"))
  uis.GoBtn = ui:GetChild("GoBtn")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
