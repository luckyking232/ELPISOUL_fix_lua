require("ActivityDungeon1022_ShopByName")

function GetActivityDungeon1022_ShopWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1022_ShopUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
