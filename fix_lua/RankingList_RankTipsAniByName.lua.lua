require("RankingList_RankTipsByName")

function GetRankingList_RankTipsAniUis(ui)
  local uis = {}
  uis.PlayerRankTips = GetRankingList_RankTipsUis(ui:GetChild("PlayerRankTips"))
  uis.root = ui
  return uis
end
