require("ActivityDungeon1003_ShopByName")

function GetActivityDungeon1003_ShopWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1003_ShopUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
