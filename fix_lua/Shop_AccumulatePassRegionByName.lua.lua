require("Shop_AccumulatePassByName")

function GetShop_AccumulatePassRegionUis(ui)
  local uis = {}
  uis.AccumulatePass = GetShop_AccumulatePassUis(ui:GetChild("AccumulatePass"))
  uis.root = ui
  return uis
end
