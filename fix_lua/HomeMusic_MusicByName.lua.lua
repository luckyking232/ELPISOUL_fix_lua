require("HomeMusic_MusicPlayListByName")
require("HomeMusic_MusicChoiceRegionByName")

function GetHomeMusic_MusicUis(ui)
  local uis = {}
  uis.MusicPlayList = GetHomeMusic_MusicPlayListUis(ui:GetChild("MusicPlayList"))
  uis.MusicChoiceRegion = GetHomeMusic_MusicChoiceRegionUis(ui:GetChild("MusicChoiceRegion"))
  uis.ReturnBtn = ui:GetChild("ReturnBtn")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
