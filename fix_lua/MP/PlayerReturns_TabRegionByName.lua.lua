require("PlayerReturns_TabTimeByName")

function GetPlayerReturns_TabRegionUis(ui)
  local uis = {}
  uis.TabTime = GetPlayerReturns_TabTimeUis(ui:GetChild("TabTime"))
  uis.TabList = ui:GetChild("TabList")
  uis.root = ui
  return uis
end
