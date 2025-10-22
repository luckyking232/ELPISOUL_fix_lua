require("Abyss_ExploreShop_LeftTabTimeByName")
require("CommonResource_RedDotByName")
require("Abyss_ExploreShop_NewByName")

function GetAbyss_ExploreShop_LeftBtnUis(ui)
  local uis = {}
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.SubtitleTxt = ui:GetChild("SubtitleTxt")
  uis.Time = GetAbyss_ExploreShop_LeftTabTimeUis(ui:GetChild("Time"))
  uis.Red = GetCommonResource_RedDotUis(ui:GetChild("Red"))
  uis.New = GetAbyss_ExploreShop_NewUis(ui:GetChild("New"))
  uis.buttonCtr = ui:GetController("button")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
