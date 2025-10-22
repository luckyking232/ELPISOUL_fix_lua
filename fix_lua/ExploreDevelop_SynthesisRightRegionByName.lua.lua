require("ExploreDevelop_SynthesisRightSpendByName")

function GetExploreDevelop_SynthesisRightRegionUis(ui)
  local uis = {}
  uis.TitleTxt = ui:GetChild("TitleTxt")
  uis.ProbabilityTxt = ui:GetChild("ProbabilityTxt")
  uis.ItemBtn = ui:GetChild("ItemBtn")
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.Spend = GetExploreDevelop_SynthesisRightSpendUis(ui:GetChild("Spend"))
  uis.c1Ctr = ui:GetController("c1")
  uis.c2Ctr = ui:GetController("c2")
  uis.root = ui
  return uis
end
