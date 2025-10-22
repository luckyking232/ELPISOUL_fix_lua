require("ActivityDungeon1014_Shop_ItemByName")

function GetActivityDungeon1014_Shop_ItemAniUis(ui)
  local uis = {}
  uis.Item = GetActivityDungeon1014_Shop_ItemUis(ui:GetChild("Item"))
  uis.root = ui
  return uis
end
