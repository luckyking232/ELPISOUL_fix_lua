require("ActivityDungeon1015_ShopByName")

function GetActivityDungeon1015_ShopWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1015_ShopUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
