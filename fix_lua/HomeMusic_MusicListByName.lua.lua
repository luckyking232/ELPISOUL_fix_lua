function GetHomeMusic_MusicListUis(ui)
  local uis = {}
  
  uis.TabList = ui:GetChild("TabList")
  uis.TipsList = ui:GetChild("TipsList")
  uis.root = ui
  return uis
end
