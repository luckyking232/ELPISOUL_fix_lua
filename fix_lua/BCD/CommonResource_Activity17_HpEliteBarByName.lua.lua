require("CommonResource_Activity17_HpEliteFillByName")

function GetCommonResource_Activity17_HpEliteBarUis(ui)
  local uis = {}
  uis.bar = GetCommonResource_Activity17_HpEliteFillUis(ui:GetChild("bar"))
  uis.FirmProgressBar = ui:GetChild("FirmProgressBar")
  uis.root = ui
  return uis
end
