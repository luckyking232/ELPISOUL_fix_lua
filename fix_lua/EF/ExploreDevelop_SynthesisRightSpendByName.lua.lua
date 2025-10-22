require("ExploreDevelop_SynthesisRightSpendNumberByName")
require("ExploreDevelop_SynthesisRightSpendLackWordByName")

function GetExploreDevelop_SynthesisRightSpendUis(ui)
  local uis = {}
  uis.Spend = GetExploreDevelop_SynthesisRightSpendNumberUis(ui:GetChild("Spend"))
  uis.SureBtn = ui:GetChild("SureBtn")
  uis.LackWord = GetExploreDevelop_SynthesisRightSpendLackWordUis(ui:GetChild("LackWord"))
  uis.c1Ctr = ui:GetController("c1")
  uis.root = ui
  return uis
end
