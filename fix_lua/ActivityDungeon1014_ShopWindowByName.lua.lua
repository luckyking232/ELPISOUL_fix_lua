require("ActivityDungeon1014_ShopByName")

function GetActivityDungeon1014_ShopWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1014_ShopUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
