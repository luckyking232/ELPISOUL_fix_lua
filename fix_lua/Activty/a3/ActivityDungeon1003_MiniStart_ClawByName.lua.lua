function GetActivityDungeon1003_MiniStart_ClawUis(ui)
  local uis = {}
  
  uis.EffectLoader = ui:GetChild("EffectLoader")
  uis.EffectHolder = ui:GetChild("EffectHolder")
  uis.LeftImage = ui:GetChild("LeftImage")
  uis.RightImage = ui:GetChild("RightImage")
  uis.buttonCtr = ui:GetController("button")
  uis.root = ui
  return uis
end
