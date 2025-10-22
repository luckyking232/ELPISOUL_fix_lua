require("CommonResource_Activity17_HpMonsterFillByName")

function GetCommonResource_Activity17_HpMonsterBarUis(ui)
  local uis = {}
  uis.bar = GetCommonResource_Activity17_HpMonsterFillUis(ui:GetChild("bar"))
  uis.FirmProgressBar = ui:GetChild("FirmProgressBar")
  uis.root = ui
  return uis
end
