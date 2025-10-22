require("ActivityDungeon1013_Shop_ItemByName")

function GetActivityDungeon1013_Shop_ItemAniUis(ui)
  local uis = {}
  uis.Item = GetActivityDungeon1013_Shop_ItemUis(ui:GetChild("Item"))
  uis.root = ui
  return uis
end
