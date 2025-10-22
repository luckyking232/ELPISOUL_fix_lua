require("ActivityDungeon1021_ShopByName")

function GetActivityDungeon1021_ShopWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1021_ShopUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
