function GetPlayerReturns_Popup_TipsUis(ui)
  local uis = {}
  
  uis.GoBtn = ui:GetChild("GoBtn")
  uis.TitleTxt = ui:GetChild("TitleTxt")
  uis.WordList = ui:GetChild("WordList")
  uis.root = ui
  return uis
end
