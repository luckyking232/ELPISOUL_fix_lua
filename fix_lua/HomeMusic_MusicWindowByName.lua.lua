require("HomeMusic_MusicByName")

function GetHomeMusic_MusicWindowUis(ui)
  local uis = {}
  uis.Main = GetHomeMusic_MusicUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
