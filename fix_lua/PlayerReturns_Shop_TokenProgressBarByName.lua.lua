require("PlayerReturns_Shop_TokenProgressFillByName")

function GetPlayerReturns_Shop_TokenProgressBarUis(ui)
  local uis = {}
  uis.bar = GetPlayerReturns_Shop_TokenProgressFillUis(ui:GetChild("bar"))
  uis.root = ui
  return uis
end
