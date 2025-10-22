function GetHomeMusic_MusicPlayListUis(ui)
  local uis = {}
  
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.TipsList = ui:GetChild("TipsList")
  uis.UpBtn = ui:GetChild("UpBtn")
  uis.DownBtn = ui:GetChild("DownBtn")
  uis.DeleteBtn = ui:GetChild("DeleteBtn")
  uis.root = ui
  return uis
end
