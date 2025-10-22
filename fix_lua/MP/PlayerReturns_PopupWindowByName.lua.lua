require("PlayerReturns_PopupByName")

function GetPlayerReturns_PopupWindowUis(ui)
  local uis = {}
  uis.Main = GetPlayerReturns_PopupUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
