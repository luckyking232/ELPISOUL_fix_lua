require("CommonResource_SoulFillByName")

function GetCommonResource_SoulBarUis(ui)
  local uis = {}
  uis.bar = GetCommonResource_SoulFillUis(ui:GetChild("bar"))
  uis.root = ui
  return uis
end
