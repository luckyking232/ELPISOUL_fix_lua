require("CommonResource_ItemFrameByName")

function GetActivityCasket02_ExplainRewardItemUis(ui)
  local uis = {}
  uis.RewardTxt = ui:GetChild("RewardTxt")
  uis.Item = GetCommonResource_ItemFrameUis(ui:GetChild("Item"))
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
