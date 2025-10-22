require("ExploreDevelop_SealLevel_BreachByName")
require("ExploreDevelop_SealLevel_AttributeRegionByName")
require("ExploreDevelop_SealLevel_MaxByName")

function GetExploreDevelop_SealLevel_LevelRegionUis(ui)
  local uis = {}
  uis.ExpProgressBar = ui:GetChild("ExpProgressBar")
  uis.Breach = GetExploreDevelop_SealLevel_BreachUis(ui:GetChild("Breach"))
  uis.AttributeRegion = GetExploreDevelop_SealLevel_AttributeRegionUis(ui:GetChild("AttributeRegion"))
  uis.SpendList = ui:GetChild("SpendList")
  uis.UpBtn = ui:GetChild("UpBtn")
  uis.Max = GetExploreDevelop_SealLevel_MaxUis(ui:GetChild("Max"))
  uis.breachCtr = ui:GetController("breach")
  uis.levelmaxCtr = ui:GetController("levelmax")
  uis.root = ui
  return uis
end
