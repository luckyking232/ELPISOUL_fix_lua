require("ActivityDungeon1005_Shop_ItemByName")

function GetActivityDungeon1005_Shop_ItemAniUis(ui)
  local uis = {}
  uis.Item = GetActivityDungeon1005_Shop_ItemUis(ui:GetChild("Item"))
  uis.root = ui
  return uis
end
