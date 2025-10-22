require("BadgeOverview_Attribute1ByName")

function GetBadgeOverview_AttributeUis(ui)
  local uis = {}
  uis.PicLoader = ui:GetChild("PicLoader")
  uis.Attribute1 = GetBadgeOverview_Attribute1Uis(ui:GetChild("Attribute1"))
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.TypeTxt = ui:GetChild("TypeTxt")
  uis.LevelTxt = ui:GetChild("LevelTxt")
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.c3Ctr = ui:GetController("c3")
  uis.root = ui
  return uis
end
