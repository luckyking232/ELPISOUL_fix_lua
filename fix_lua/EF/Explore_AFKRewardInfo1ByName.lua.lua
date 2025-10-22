require("Explore_AFKRewardItemByName")

function GetExplore_AFKRewardInfo1Uis(ui)
  local uis = {}
  uis.Item = GetExplore_AFKRewardItemUis(ui:GetChild("Item"))
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.AddNumberTxt = ui:GetChild("AddNumberTxt")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
