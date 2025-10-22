require("ActivityDungeon1008_Shop_ItemByName")

function GetActivityDungeon1008_Shop_ItemAniUis(ui)
  local uis = {}
  uis.Item = GetActivityDungeon1008_Shop_ItemUis(ui:GetChild("Item"))
  uis.root = ui
  return uis
end
