require("PlayerReturns_Shop_ItemLockWordByName")

function GetPlayerReturns_Shop_ItemLockUis(ui)
  local uis = {}
  uis.LockWord = GetPlayerReturns_Shop_ItemLockWordUis(ui:GetChild("LockWord"))
  uis.root = ui
  return uis
end
