require("Passport_BigTabBtnCardBgByName")
require("Passport_BigTabBtnBgByName")

function GetPassport_BigTabBtnUis(ui)
  local uis = {}
  uis.CardBg = GetPassport_BigTabBtnCardBgUis(ui:GetChild("CardBg"))
  uis.Bg = GetPassport_BigTabBtnBgUis(ui:GetChild("Bg"))
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.TimeTxt = ui:GetChild("TimeTxt")
  uis.buttonCtr = ui:GetController("button")
  uis.root = ui
  return uis
end
