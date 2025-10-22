require("ActivityDungeon1016_BuyLevelDes2ByName")

function GetActivityDungeon1016_BuyLevelDesWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1016_BuyLevelDes2Uis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
