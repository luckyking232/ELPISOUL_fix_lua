require("ActivityDungeon1019_BuyLevelDes2ByName")

function GetActivityDungeon1019_BuyLevelDesWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1019_BuyLevelDes2Uis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
