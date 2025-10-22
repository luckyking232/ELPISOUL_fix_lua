require("CommonResource_Activity17_HpEliteFirmFillByName")

function GetCommonResource_Activity17_HpEliteFirmBarUis(ui)
  local uis = {}
  uis.bar = GetCommonResource_Activity17_HpEliteFirmFillUis(ui:GetChild("bar"))
  uis.root = ui
  return uis
end
