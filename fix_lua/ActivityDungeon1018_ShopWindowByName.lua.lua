require("ActivityDungeon1018_ShopByName")

function GetActivityDungeon1018_ShopWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1018_ShopUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
