require("CardAttribute_AttributeDes_Type1BgByName")

function GetCardAttribute_AttributeDes_Type1BtnUis(ui)
  local uis = {}
  uis.Bg = GetCardAttribute_AttributeDes_Type1BgUis(ui:GetChild("Bg"))
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.buttonCtr = ui:GetController("button")
  uis.root = ui
  return uis
end
