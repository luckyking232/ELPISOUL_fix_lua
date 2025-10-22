require("ActivityDungeon1018_BuyLevelDes2ByName")

function GetActivityDungeon1018_BuyLevelDesWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1018_BuyLevelDes2Uis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
