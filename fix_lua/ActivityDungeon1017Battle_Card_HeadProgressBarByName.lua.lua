function GetActivityDungeon1017Battle_Card_HeadProgressBarUis(ui)
  local uis = {}
  
  uis.PicLoader = ui:GetChild("PicLoader")
  uis.LevelTxt = ui:GetChild("LevelTxt")
  uis.lockCtr = ui:GetController("lock")
  uis.root = ui
  return uis
end
