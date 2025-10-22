require("ActivityDungeon1011_ShopByName")

function GetActivityDungeon1011_ShopWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1011_ShopUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
