function GetActivityDungeon1008_MiniStart_ItemUis(ui)
  local uis = {}
  
  uis.EffectHolder = ui:GetChild("EffectHolder")
  uis.itemCtr = ui:GetController("item")
  uis.root = ui
  return uis
end
