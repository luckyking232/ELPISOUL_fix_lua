require("ActivityDungeon1003_Shop_ItemByName")

function GetActivityDungeon1003_Shop_ItemAniUis(ui)
  local uis = {}
  uis.Item = GetActivityDungeon1003_Shop_ItemUis(ui:GetChild("Item"))
  uis.root = ui
  return uis
end
