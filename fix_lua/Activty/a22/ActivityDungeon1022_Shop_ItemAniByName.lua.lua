require("ActivityDungeon1022_Shop_ItemByName")

function GetActivityDungeon1022_Shop_ItemAniUis(ui)
  local uis = {}
  uis.Item = GetActivityDungeon1022_Shop_ItemUis(ui:GetChild("Item"))
  uis.root = ui
  return uis
end
