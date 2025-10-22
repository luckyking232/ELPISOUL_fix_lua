require("CommonResource_BackGroundByName")
require("ExploreDevelop_SynthesisMidRegionByName")
require("ExploreDevelop_SynthesisMidNothingByName")
require("ExploreDevelop_SynthesisLeftRegionByName")
require("ExploreDevelop_NumberStripByName")
require("ExploreDevelop_SynthesisRightRegionByName")
require("CommonResource_CurrencyReturnByName")

function GetExploreDevelop_SynthesisUis(ui)
  local uis = {}
  uis.BackGround = GetCommonResource_BackGroundUis(ui:GetChild("BackGround"))
  uis.MidRegion = GetExploreDevelop_SynthesisMidRegionUis(ui:GetChild("MidRegion"))
  uis.MidNothing = GetExploreDevelop_SynthesisMidNothingUis(ui:GetChild("MidNothing"))
  uis.LeftRegion = GetExploreDevelop_SynthesisLeftRegionUis(ui:GetChild("LeftRegion"))
  uis.NumberStrip = GetExploreDevelop_NumberStripUis(ui:GetChild("NumberStrip"))
  uis.MaxBtn = ui:GetChild("MaxBtn")
  uis.RightRegion = GetExploreDevelop_SynthesisRightRegionUis(ui:GetChild("RightRegion"))
  uis.AssetsTipsList = ui:GetChild("AssetsTipsList")
  uis.TabList = ui:GetChild("TabList")
  uis.CurrencyReturn = GetCommonResource_CurrencyReturnUis(ui:GetChild("CurrencyReturn"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
