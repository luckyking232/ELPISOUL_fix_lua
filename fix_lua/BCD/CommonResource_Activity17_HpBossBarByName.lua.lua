require("CommonResource_Activity17_HpBossFillByName")

function GetCommonResource_Activity17_HpBossBarUis(ui)
  local uis = {}
  uis.bar = GetCommonResource_Activity17_HpBossFillUis(ui:GetChild("bar"))
  uis.FirmProgressBar = ui:GetChild("FirmProgressBar")
  uis.root = ui
  return uis
end
