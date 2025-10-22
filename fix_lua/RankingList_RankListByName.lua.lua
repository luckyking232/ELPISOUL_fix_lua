function GetRankingList_RankListUis(ui)
  local uis = {}
  
  uis.RankList = ui:GetChild("RankList")
  uis.root = ui
  return uis
end
