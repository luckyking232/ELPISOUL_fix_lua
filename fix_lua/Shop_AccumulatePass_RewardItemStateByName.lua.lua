require("Shop_AccumulatePass_RewardItemByName")

function GetShop_AccumulatePass_RewardItemStateUis(ui)
  local uis = {}
  uis.ProgressTxt = ui:GetChild("ProgressTxt")
  uis.Item = GetShop_AccumulatePass_RewardItemUis(ui:GetChild("Item"))
  uis.EffectHolder = ui:GetChild("EffectHolder")
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
