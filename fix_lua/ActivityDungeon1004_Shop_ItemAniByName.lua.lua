require("ActivityDungeon1004_Shop_ItemByName")

function GetActivityDungeon1004_Shop_ItemAniUis(ui)
  local uis = {}
  uis.Item = GetActivityDungeon1004_Shop_ItemUis(ui:GetChild("Item"))
  uis.root = ui
  return uis
end
