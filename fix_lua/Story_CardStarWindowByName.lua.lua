require("Story_CardStarByName")

function GetStory_CardStarWindowUis(ui)
  local uis = {}
  uis.Main = GetStory_CardStarUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
