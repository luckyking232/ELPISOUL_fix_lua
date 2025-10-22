require("CommonResource_PopupBgByName")
require("RankingList_RankEmptyByName")
require("RankingList_RankListByName")
require("RankingList_RankInfoByName")
require("RankingList_RankRegionByName")

function GetRankingList_RankingUis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.TabList = ui:GetChild("TabList")
  uis.RankEmpty = GetRankingList_RankEmptyUis(ui:GetChild("RankEmpty"))
  uis.RankList = GetRankingList_RankListUis(ui:GetChild("RankList"))
  uis.Info = GetRankingList_RankInfoUis(ui:GetChild("Info"))
  uis.Region = GetRankingList_RankRegionUis(ui:GetChild("Region"))
  uis.ReturnBtn = ui:GetChild("ReturnBtn")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
