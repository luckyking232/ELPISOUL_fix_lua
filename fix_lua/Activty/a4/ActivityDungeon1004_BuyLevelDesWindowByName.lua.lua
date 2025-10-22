require("ActivityDungeon1004_BuyLevelDes2ByName")

function GetActivityDungeon1004_BuyLevelDesWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1004_BuyLevelDes2Uis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
