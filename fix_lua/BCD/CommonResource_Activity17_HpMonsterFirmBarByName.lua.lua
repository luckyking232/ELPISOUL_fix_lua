require("CommonResource_Activity17_HpMonsterFirmFillByName")

function GetCommonResource_Activity17_HpMonsterFirmBarUis(ui)
  local uis = {}
  uis.bar = GetCommonResource_Activity17_HpMonsterFirmFillUis(ui:GetChild("bar"))
  uis.root = ui
  return uis
end
