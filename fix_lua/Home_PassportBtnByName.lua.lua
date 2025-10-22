require("CommonResource_RedDotByName")

function GetHome_PassportBtnUis(ui)
  local uis = {}
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.Red = GetCommonResource_RedDotUis(ui:GetChild("Red"))
  uis.buttonCtr = ui:GetController("button")
  uis.lockCtr = ui:GetController("lock")
  uis.casketCtr = ui:GetController("casket")
  uis.root = ui
  return uis
end
