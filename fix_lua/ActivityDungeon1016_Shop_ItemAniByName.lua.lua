require("ActivityDungeon1016_Shop_ItemByName")

function GetActivityDungeon1016_Shop_ItemAniUis(ui)
  local uis = {}
  uis.Item = GetActivityDungeon1016_Shop_ItemUis(ui:GetChild("Item"))
  uis.root = ui
  return uis
end
