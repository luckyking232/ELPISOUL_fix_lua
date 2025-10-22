require("ActivityDungeon1018_Shop_ItemByName")

function GetActivityDungeon1018_Shop_ItemAniUis(ui)
  local uis = {}
  uis.Item = GetActivityDungeon1018_Shop_ItemUis(ui:GetChild("Item"))
  uis.root = ui
  return uis
end
