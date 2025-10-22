require("ActivityDungeon1008_BuyLevelDes2ByName")

function GetActivityDungeon1008_BuyLevelDesWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1008_BuyLevelDes2Uis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
