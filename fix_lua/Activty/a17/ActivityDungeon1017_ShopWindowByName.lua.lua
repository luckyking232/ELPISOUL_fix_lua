require("ActivityDungeon1017_ShopByName")

function GetActivityDungeon1017_ShopWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1017_ShopUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
