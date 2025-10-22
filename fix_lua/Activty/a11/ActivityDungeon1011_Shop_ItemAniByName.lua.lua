require("ActivityDungeon1011_Shop_ItemByName")

function GetActivityDungeon1011_Shop_ItemAniUis(ui)
  local uis = {}
  uis.Item = GetActivityDungeon1011_Shop_ItemUis(ui:GetChild("Item"))
  uis.root = ui
  return uis
end
