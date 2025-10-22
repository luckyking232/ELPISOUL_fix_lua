require("ActivityDungeon1006_ShopByName")

function GetActivityDungeon1006_ShopWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1006_ShopUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
