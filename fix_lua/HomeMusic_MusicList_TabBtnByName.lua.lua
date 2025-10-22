require("HomeMusic_MusicList_Tab1ByName")
require("HomeMusic_MusicList_Tab2ByName")

function GetHomeMusic_MusicList_TabBtnUis(ui)
  local uis = {}
  uis.Tab1 = GetHomeMusic_MusicList_Tab1Uis(ui:GetChild("Tab1"))
  uis.Tab2 = GetHomeMusic_MusicList_Tab2Uis(ui:GetChild("Tab2"))
  uis.buttonCtr = ui:GetController("button")
  uis.root = ui
  return uis
end
