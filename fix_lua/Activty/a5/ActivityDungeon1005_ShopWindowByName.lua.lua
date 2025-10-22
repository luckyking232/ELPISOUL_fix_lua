require("ActivityDungeon1005_ShopByName")

function GetActivityDungeon1005_ShopWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1005_ShopUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
