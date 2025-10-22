require("ActivityDungeon1010_Shop_ItemByName")

function GetActivityDungeon1010_Shop_ItemAniUis(ui)
  local uis = {}
  uis.Item = GetActivityDungeon1010_Shop_ItemUis(ui:GetChild("Item"))
  uis.root = ui
  return uis
end
