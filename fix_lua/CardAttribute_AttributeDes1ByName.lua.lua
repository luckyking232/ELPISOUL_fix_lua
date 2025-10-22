require("CardAttribute_AttributeDes_TipsByName")

function GetCardAttribute_AttributeDes1Uis(ui)
  local uis = {}
  uis.Tips = GetCardAttribute_AttributeDes_TipsUis(ui:GetChild("Tips"))
  uis.root = ui
  return uis
end
