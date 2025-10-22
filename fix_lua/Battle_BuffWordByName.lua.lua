function GetBattle_BuffWordUis(ui)
  local uis = {}
  
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.colorCtr = ui:GetController("color")
  uis.arrowCtr = ui:GetController("arrow")
  uis.root = ui
  return uis
end
