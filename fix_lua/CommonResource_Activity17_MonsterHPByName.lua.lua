function GetCommonResource_Activity17_MonsterHPUis(ui)
  local uis = {}
  
  uis.HpMonsterProgressBar = ui:GetChild("HpMonsterProgressBar")
  uis.HpEliteProgressBar = ui:GetChild("HpEliteProgressBar")
  uis.HpBossProgressBar = ui:GetChild("HpBossProgressBar")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
