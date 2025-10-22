require("ActivityCasket_RewardMoveWord_01ByName")

function GetActivityCasket_OrdinaryRewardTag_1004Uis(ui)
  local uis = {}
  uis.MoveWord = GetActivityCasket_RewardMoveWord_01Uis(ui:GetChild("MoveWord"))
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.EffectHolder = ui:GetChild("EffectHolder")
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.root = ui
  return uis
end
