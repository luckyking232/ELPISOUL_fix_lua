require("Story_CardStar_Dot1ByName")
require("Story_CardStar_Dot2ByName")
require("Story_CardStar_Dot3ByName")

function GetStory_CardStar_DotAniUis(ui)
  local uis = {}
  uis.Dot1 = GetStory_CardStar_Dot1Uis(ui:GetChild("Dot1"))
  uis.Dot2 = GetStory_CardStar_Dot2Uis(ui:GetChild("Dot2"))
  uis.Dot3 = GetStory_CardStar_Dot3Uis(ui:GetChild("Dot3"))
  uis.Dot4Btn = ui:GetChild("Dot4Btn")
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.root = ui
  return uis
end
