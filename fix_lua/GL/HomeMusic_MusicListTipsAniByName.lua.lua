require("HomeMusic_MusicListTipsByName")

function GetHomeMusic_MusicListTipsAniUis(ui)
  local uis = {}
  uis.Tips = GetHomeMusic_MusicListTipsUis(ui:GetChild("Tips"))
  uis.root = ui
  return uis
end
