function GetExploreDevelop_SealLevel_ExpProgressBarUis(ui)
  local uis = {}
  
  uis.LevelTxt = ui:GetChild("LevelTxt")
  uis.LevelAniTxt = ui:GetChild("LevelAniTxt")
  uis.Level1Txt = ui:GetChild("Level1Txt")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
