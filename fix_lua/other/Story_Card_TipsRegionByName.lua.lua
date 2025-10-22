require("Story_Card_TipsTitleByName")

function GetStory_Card_TipsRegionUis(ui)
  local uis = {}
  uis.Title = GetStory_Card_TipsTitleUis(ui:GetChild("Title"))
  uis.CardList = ui:GetChild("CardList")
  uis.root = ui
  return uis
end
