require("MultipleMaterials_MultipleByName")

function GetMultipleMaterials_MultipleWindowUis(ui)
  local uis = {}
  uis.Main = GetMultipleMaterials_MultipleUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
