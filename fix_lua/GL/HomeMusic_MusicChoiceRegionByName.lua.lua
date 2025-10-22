require("HomeMusic_MusicInfoByName")
require("HomeMusic_MusicListByName")

function GetHomeMusic_MusicChoiceRegionUis(ui)
  local uis = {}
  uis.MusicInfo = GetHomeMusic_MusicInfoUis(ui:GetChild("MusicInfo"))
  uis.MusicList = GetHomeMusic_MusicListUis(ui:GetChild("MusicList"))
  uis.root = ui
  return uis
end
