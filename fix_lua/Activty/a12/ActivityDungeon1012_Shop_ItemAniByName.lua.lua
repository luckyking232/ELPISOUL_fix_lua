require("ActivityDungeon1012_Shop_ItemByName")

function GetActivityDungeon1012_Shop_ItemAniUis(ui)
  local uis = {}
  uis.Item = GetActivityDungeon1012_Shop_ItemUis(ui:GetChild("Item"))
  uis.root = ui
  return uis
end
