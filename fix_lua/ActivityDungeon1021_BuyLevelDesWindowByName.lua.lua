require("ActivityDungeon1021_BuyLevelDes2ByName")

function GetActivityDungeon1021_BuyLevelDesWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1021_BuyLevelDes2Uis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
