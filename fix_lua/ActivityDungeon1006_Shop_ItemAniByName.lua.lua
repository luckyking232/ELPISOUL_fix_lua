require("ActivityDungeon1006_Shop_ItemByName")

function GetActivityDungeon1006_Shop_ItemAniUis(ui)
  local uis = {}
  uis.Item = GetActivityDungeon1006_Shop_ItemUis(ui:GetChild("Item"))
  uis.root = ui
  return uis
end
