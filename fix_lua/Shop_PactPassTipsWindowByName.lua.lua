require("Shop_PactPassTipsByName")

function GetShop_PactPassTipsWindowUis(ui)
  local uis = {}
  uis.Main = GetShop_PactPassTipsUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
