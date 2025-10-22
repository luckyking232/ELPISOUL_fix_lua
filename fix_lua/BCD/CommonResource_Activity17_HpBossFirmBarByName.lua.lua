require("CommonResource_Activity17_HpBossFirmFillByName")

function GetCommonResource_Activity17_HpBossFirmBarUis(ui)
  local uis = {}
  uis.bar = GetCommonResource_Activity17_HpBossFirmFillUis(ui:GetChild("bar"))
  uis.root = ui
  return uis
end
