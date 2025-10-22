require("Story_Card_ElementChoiceByName")
require("Story_Card_OccupationChoiceByName")

function GetStory_Card_GatherChoiceUis(ui)
  local uis = {}
  uis.ElementChoice = GetStory_Card_ElementChoiceUis(ui:GetChild("ElementChoice"))
  uis.OccupationChoice = GetStory_Card_OccupationChoiceUis(ui:GetChild("OccupationChoice"))
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.Number1Txt = ui:GetChild("Number1Txt")
  uis.AllBtn = ui:GetChild("AllBtn")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
