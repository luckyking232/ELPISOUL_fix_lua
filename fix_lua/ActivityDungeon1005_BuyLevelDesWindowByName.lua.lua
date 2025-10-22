require("ActivityDungeon1005_BuyLevelDes2ByName")

function GetActivityDungeon1005_BuyLevelDesWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1005_BuyLevelDes2Uis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
