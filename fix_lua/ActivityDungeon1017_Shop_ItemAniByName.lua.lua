require("ActivityDungeon1017_Shop_ItemByName")

function GetActivityDungeon1017_Shop_ItemAniUis(ui)
  local uis = {}
  uis.Item = GetActivityDungeon1017_Shop_ItemUis(ui:GetChild("Item"))
  uis.root = ui
  return uis
end
