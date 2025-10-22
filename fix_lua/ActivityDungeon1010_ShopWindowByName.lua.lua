require("ActivityDungeon1010_ShopByName")

function GetActivityDungeon1010_ShopWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1010_ShopUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
