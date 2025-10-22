require("Explore_AFKTimeChoiceRegionByName")
require("Explore_AFKRewardUpRegionByName")
require("Explore_AFKCountdownByName")
require("Explore_AFKEndByName")
require("Explore_AFKUseWordByName")

function GetExplore_AFKRegoinUis(ui)
  local uis = {}
  uis.PicLoader = ui:GetChild("PicLoader")
  uis.CardList = ui:GetChild("CardList")
  uis.SwitchBtnList = ui:GetChild("SwitchBtnList")
  uis.TimeChoice = GetExplore_AFKTimeChoiceRegionUis(ui:GetChild("TimeChoice"))
  uis.RewardUp = GetExplore_AFKRewardUpRegionUis(ui:GetChild("RewardUp"))
  uis.Countdown = GetExplore_AFKCountdownUis(ui:GetChild("Countdown"))
  uis.End = GetExplore_AFKEndUis(ui:GetChild("End"))
  uis.StartBtn = ui:GetChild("StartBtn")
  uis.GiveUpBtn = ui:GetChild("GiveUpBtn")
  uis.GetBtn = ui:GetChild("GetBtn")
  uis.Word = GetExplore_AFKUseWordUis(ui:GetChild("Word"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
