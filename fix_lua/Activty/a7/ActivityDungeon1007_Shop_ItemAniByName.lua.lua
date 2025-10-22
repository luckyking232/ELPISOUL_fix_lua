require("ActivityDungeon1007_Shop_ItemByName")

function GetActivityDungeon1007_Shop_ItemAniUis(ui)
  local uis = {}
  uis.Item = GetActivityDungeon1007_Shop_ItemUis(ui:GetChild("Item"))
  uis.root = ui
  return uis
end
