require("ExploreDevelop_SynthesisByName")

function GetExploreDevelop_SynthesisWindowUis(ui)
  local uis = {}
  uis.Main = GetExploreDevelop_SynthesisUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
