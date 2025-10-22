function GetActivityDungeon1017Battle_DPS1Uis(ui)
  local uis = {}
  
  uis.PicLoader = ui:GetChild("PicLoader")
  uis.DPSProgressBar = ui:GetChild("DPSProgressBar")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
