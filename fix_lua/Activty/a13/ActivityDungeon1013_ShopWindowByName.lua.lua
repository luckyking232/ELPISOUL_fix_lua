require("ActivityDungeon1013_ShopByName")

function GetActivityDungeon1013_ShopWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1013_ShopUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
