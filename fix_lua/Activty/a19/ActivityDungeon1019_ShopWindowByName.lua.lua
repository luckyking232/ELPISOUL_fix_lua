require("ActivityDungeon1019_ShopByName")

function GetActivityDungeon1019_ShopWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1019_ShopUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
