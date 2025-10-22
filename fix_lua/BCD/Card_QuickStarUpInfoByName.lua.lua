function GetCard_QuickStarUpInfoUis(ui)
  local uis = {}
  
  uis.PicLoader = ui:GetChild("PicLoader")
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.OpenTxt = ui:GetChild("OpenTxt")
  uis.WordList = ui:GetChild("WordList")
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.root = ui
  return uis
end
