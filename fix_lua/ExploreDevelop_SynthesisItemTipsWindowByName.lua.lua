require("ExploreDevelop_SynthesisItemTips2ByName")

function GetExploreDevelop_SynthesisItemTipsWindowUis(ui)
  local uis = {}
  uis.Main = GetExploreDevelop_SynthesisItemTips2Uis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
