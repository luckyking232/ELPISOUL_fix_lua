require("Shop_PactPassByName")

function GetShop_PactPassRegionUis(ui)
  local uis = {}
  uis.PactPass = GetShop_PactPassUis(ui:GetChild("PactPass"))
  uis.root = ui
  return uis
end
