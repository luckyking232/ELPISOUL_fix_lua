require("Shop_PactPass_AllFrameByName")

function GetShop_PactPass_ItemRegion2Uis(ui)
  local uis = {}
  uis.Top = GetShop_PactPass_AllFrameUis(ui:GetChild("Top"))
  uis.Below = GetShop_PactPass_AllFrameUis(ui:GetChild("Below"))
  uis.NumberTxt = ui:GetChild("NumberTxt")
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
