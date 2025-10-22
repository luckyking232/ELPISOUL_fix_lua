require("ActivityDungeon1008_ShopByName")

function GetActivityDungeon1008_ShopWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1008_ShopUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
