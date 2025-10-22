require("BadgeOverview_Attribute2ByName")

function GetBadgeOverview_Attribute1Uis(ui)
  local uis = {}
  uis.Attribute2 = GetBadgeOverview_Attribute2Uis(ui:GetChild("Attribute2"))
  uis.AttributeList = ui:GetChild("AttributeList")
  uis.root = ui
  return uis
end
