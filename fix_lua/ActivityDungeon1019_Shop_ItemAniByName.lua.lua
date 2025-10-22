require("ActivityDungeon1019_Shop_ItemByName")

function GetActivityDungeon1019_Shop_ItemAniUis(ui)
  local uis = {}
  uis.Item = GetActivityDungeon1019_Shop_ItemUis(ui:GetChild("Item"))
  uis.root = ui
  return uis
end
