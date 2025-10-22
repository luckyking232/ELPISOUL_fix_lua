require("ActivityDungeon1016_ShopByName")

function GetActivityDungeon1016_ShopWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1016_ShopUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
