require("ExploreDevelop_SealLevel_BreachUpByName")

function GetExploreDevelop_SealLevel_AttributeRegionUis(ui)
  local uis = {}
  uis.BreachUp = GetExploreDevelop_SealLevel_BreachUpUis(ui:GetChild("BreachUp"))
  uis.AttributeList = ui:GetChild("AttributeList")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
