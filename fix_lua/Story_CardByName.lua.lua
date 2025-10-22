require("Story_Card_TitleByName")
require("Story_Card_ScreenByName")

function GetStory_CardUis(ui)
  local uis = {}
  uis.Title = GetStory_Card_TitleUis(ui:GetChild("Title"))
  uis.CardList = ui:GetChild("CardList")
  uis.RewardBtn = ui:GetChild("RewardBtn")
  uis.ScreenBtn = ui:GetChild("ScreenBtn")
  uis.Screen = GetStory_Card_ScreenUis(ui:GetChild("Screen"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
