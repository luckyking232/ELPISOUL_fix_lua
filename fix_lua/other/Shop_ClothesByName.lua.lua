require("Shop_LeftTabByName")

function GetShop_ClothesUis(ui)
  local uis = {}
  uis.ClothesList = ui:GetChild("ClothesList")
  uis.LeftTab = GetShop_LeftTabUis(ui:GetChild("LeftTab"))
  uis.root = ui
  return uis
end
