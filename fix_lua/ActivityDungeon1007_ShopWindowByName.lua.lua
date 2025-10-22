require("ActivityDungeon1007_ShopByName")

function GetActivityDungeon1007_ShopWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1007_ShopUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
