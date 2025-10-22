require("CommonResource_PopupBgByName")
require("ExploreSign02_MapByName")
require("ExploreSign02_ExploreBtnAniByName")

function GetExploreSign02_ExploreSignUis(ui)
  local uis = {}
  uis.PopupBg = GetCommonResource_PopupBgUis(ui:GetChild("PopupBg"))
  uis.Map = GetExploreSign02_MapUis(ui:GetChild("Map"))
  uis.Explore = GetExploreSign02_ExploreBtnAniUis(ui:GetChild("Explore"))
  uis.CloseBtn = ui:GetChild("CloseBtn")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
