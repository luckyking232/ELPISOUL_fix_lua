require("Story_Card_GatherChoiceByName")

function GetStory_Card_ScreenUis(ui)
  local uis = {}
  uis.PopupCloseBtn = ui:GetChild("PopupCloseBtn")
  uis.GatherChoice = GetStory_Card_GatherChoiceUis(ui:GetChild("GatherChoice"))
  uis.root = ui
  return uis
end
