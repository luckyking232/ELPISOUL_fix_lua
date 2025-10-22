require("ActivityDungeon1004_ShopByName")

function GetActivityDungeon1004_ShopWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1004_ShopUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
