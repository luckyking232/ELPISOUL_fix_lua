function GetTowerSpecial_RewardItemListUis(ui)
  local uis = {}
  
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.GetTxt = ui:GetChild("GetTxt")
  uis.ProgressTxt = ui:GetChild("ProgressTxt")
  uis.RewardList = ui:GetChild("RewardList")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
