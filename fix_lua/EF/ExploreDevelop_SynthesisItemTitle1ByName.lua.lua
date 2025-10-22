require("ExploreDevelop_SynthesisItemListByName")

function GetExploreDevelop_SynthesisItemTitle1Uis(ui)
  local uis = {}
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.ItemList = GetExploreDevelop_SynthesisItemListUis(ui:GetChild("ItemList"))
  uis.root = ui
  return uis
end
