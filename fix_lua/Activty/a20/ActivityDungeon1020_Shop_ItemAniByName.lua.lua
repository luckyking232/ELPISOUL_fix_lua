require("ActivityDungeon1020_Shop_ItemByName")

function GetActivityDungeon1020_Shop_ItemAniUis(ui)
  local uis = {}
  uis.Item = GetActivityDungeon1020_Shop_ItemUis(ui:GetChild("Item"))
  uis.root = ui
  return uis
end
