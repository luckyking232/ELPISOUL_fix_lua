require("CommonResource_RedDotByName")
require("CommonResource_CardGetNewByName")

function GetHome_ScheduleBtnUis(ui)
  local uis = {}
  uis.NameTxt = ui:GetChild("NameTxt")
  uis.Red = GetCommonResource_RedDotUis(ui:GetChild("Red"))
  uis.TimeHolder = ui:GetChild("TimeHolder")
  uis.New = GetCommonResource_CardGetNewUis(ui:GetChild("New"))
  uis.buttonCtr = ui:GetController("button")
  uis.newCtr = ui:GetController("new")
  uis.timeCtr = ui:GetController("time")
  uis.root = ui
  return uis
end
