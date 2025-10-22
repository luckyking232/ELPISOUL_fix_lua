require("CommonResource_PopupBgByName")
require("ExploreSign01_MapByName")
require("ExploreSign01_ExploreBtnAniByName")

function GetExploreSign01_ExploreSignUis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.Map = GetExploreSign01_MapUis(ui:GetChild("Map"))
  uis.Explore = GetExploreSign01_ExploreBtnAniUis(ui:GetChild("Explore"))
  uis.CloseBtn = ui:GetChild("CloseBtn")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
