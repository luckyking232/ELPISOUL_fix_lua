require("RankingList_RankingByName")

function GetRankingList_RankingWindowUis(ui)
  local uis = {}
  uis.Main = GetRankingList_RankingUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
