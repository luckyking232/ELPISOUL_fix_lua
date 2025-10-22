require("HomeMusic_MusicInfo_RecordAniByName")

function GetHomeMusic_MusicInfoUis(ui)
  local uis = {}
  uis.RecordAni = GetHomeMusic_MusicInfo_RecordAniUis(ui:GetChild("RecordAni"))
  uis.PlayListBtn = ui:GetChild("PlayListBtn")
  uis.MusicTxt = ui:GetChild("MusicTxt")
  uis.ComposerTxt = ui:GetChild("ComposerTxt")
  uis.CollectBtn = ui:GetChild("CollectBtn")
  uis.AddLiveBtn = ui:GetChild("AddLiveBtn")
  uis.root = ui
  return uis
end
