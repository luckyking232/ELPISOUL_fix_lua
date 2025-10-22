require("Abyss_ExploreShop_ItemByName")

function GetAbyss_ExploreShop_ItemAniUis(ui)
  local uis = {}
  uis.Item = GetAbyss_ExploreShop_ItemUis(ui:GetChild("Item"))
  uis.root = ui
  return uis
end
