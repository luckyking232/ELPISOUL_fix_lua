require("ActivityDungeon1014_BuyLevelDes2ByName")

function GetActivityDungeon1014_BuyLevelDesWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1014_BuyLevelDes2Uis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
