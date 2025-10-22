require("ActivityDungeon1012_ShopByName")

function GetActivityDungeon1012_ShopWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1012_ShopUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
