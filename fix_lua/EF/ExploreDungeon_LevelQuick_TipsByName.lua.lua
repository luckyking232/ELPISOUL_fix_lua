function GetExploreDungeon_LevelQuick_TipsUis(ui)
  local uis = {}
  
  uis.TitleTxt = ui:GetChild("TitleTxt")
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.ItemList = ui:GetChild("ItemList")
  uis.SpendList = ui:GetChild("SpendList")
  uis.SureBtn = ui:GetChild("SureBtn")
  uis.root = ui
  return uis
end
