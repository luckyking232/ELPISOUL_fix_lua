require("Story_Card_TipsBgByName")

function GetStory_Card_TipsUis(ui)
  local uis = {}
  uis.TipsBg = GetStory_Card_TipsBgUis(ui:GetChild("TipsBg"))
  uis.StarList = ui:GetChild("StarList")
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.RewardBtn = ui:GetChild("RewardBtn")
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.c3Ctr = ui:GetController("c3")
  uis.root = ui
  return uis
end
