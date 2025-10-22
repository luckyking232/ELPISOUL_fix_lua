require("PlayerReturns_PlayerReturnsByName")

function GetPlayerReturns_PlayerReturnsWindowUis(ui)
  local uis = {}
  uis.Main = GetPlayerReturns_PlayerReturnsUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
