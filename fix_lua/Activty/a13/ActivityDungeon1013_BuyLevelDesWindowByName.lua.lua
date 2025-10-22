require("ActivityDungeon1013_BuyLevelDes2ByName")

function GetActivityDungeon1013_BuyLevelDesWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1013_BuyLevelDes2Uis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
