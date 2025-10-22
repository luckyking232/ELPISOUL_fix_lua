require("RankingList_RankNumberByName")
require("CommonResource_HeadByName")

function GetRankingList_RankTipsUis(ui)
  local uis = {}
  uis.Number = GetRankingList_RankNumberUis(ui:GetChild("Number"))
  uis.Head = GetCommonResource_HeadUis(ui:GetChild("Head"))
  uis.GulidIconLoader = ui:GetChild("GulidIconLoader")
  uis.Name1Txt = ui:GetChild("Name1Txt")
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.LevelTxt = ui:GetChild("LevelTxt")
  uis.NumberWordTxt = ui:GetChild("NumberWordTxt")
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.c1Ctr = ui:GetController("c1")
  uis.typeCtr = ui:GetController("type")
  uis.root = ui
  return uis
end
