require("CommonResource_BackGroundByName")
require("ExploreDevelop_DevelopWearRegionByName")
require("ExploreDevelop_SealRegionByName")
require("ExploreDevelop_DevelopEquipmentRegionByName")
require("CommonResource_CurrencyReturnByName")

function GetExploreDevelop_DevelopUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.WearRegion = GetExploreDevelop_DevelopWearRegionUis(ui:GetChild("WearRegion"))
  uis.SealRegion = GetExploreDevelop_SealRegionUis(ui:GetChild("SealRegion"))
  uis.EquipmentRegion = GetExploreDevelop_DevelopEquipmentRegionUis(ui:GetChild("EquipmentRegion"))
  uis.AttributeList = ui:GetChild("AttributeList")
  uis.TabList = ui:GetChild("TabList")
  uis.SynthesisBtn = ui:GetChild("SynthesisBtn")
  uis.CurrencyReturn = GetCommonResource_CurrencyReturnUis(ui:GetChild("CurrencyReturn"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
