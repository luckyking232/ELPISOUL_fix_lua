require("ActivityDungeon1020_BuyLevelDes2ByName")

function GetActivityDungeon1020_BuyLevelDesWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1020_BuyLevelDes2Uis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
