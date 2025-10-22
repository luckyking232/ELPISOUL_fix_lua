require("ActivityDungeon1020_ShopByName")

function GetActivityDungeon1020_ShopWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1020_ShopUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
