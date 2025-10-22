function GetAbyss_ExploreDungeonProgressUis(ui)
  local uis = {}
  
  uis.ExploreDungeonProgressBar = ui:GetChild("ExploreDungeonProgressBar")
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.root = ui
  return uis
end
