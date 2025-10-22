require("BadgeOverview_CardOccupationByName")
require("BadgeOverview_HeadFrameBgByName")
require("BadgeOverview_CardBreachByName")
require("BadgeOverview_CardMark1ByName")
require("BadgeOverview_CardMark2ByName")
require("BadgeOverview_CardMark3ByName")
require("CommonResource_RedDotByName")

function GetBadgeOverview_HeadFrameUis(ui)
  local uis = {}
  uis.Occupation = GetBadgeOverview_CardOccupationUis(ui:GetChild("Occupation"))
  uis.HeadFrameBg = GetBadgeOverview_HeadFrameBgUis(ui:GetChild("HeadFrameBg"))
  uis.CardBreach = GetBadgeOverview_CardBreachUis(ui:GetChild("CardBreach"))
  uis.LevelTxt = ui:GetChild("LevelTxt")
  uis.Mark1 = GetBadgeOverview_CardMark1Uis(ui:GetChild("Mark1"))
  uis.Mark2 = GetBadgeOverview_CardMark2Uis(ui:GetChild("Mark2"))
  uis.Mark3 = GetBadgeOverview_CardMark3Uis(ui:GetChild("Mark3"))
  uis.Red = GetCommonResource_RedDotUis(ui:GetChild("Red"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
