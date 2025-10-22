require("ActivityDungeon1003_BuyLevelDes2ByName")

function GetActivityDungeon1003_BuyLevelDesWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1003_BuyLevelDes2Uis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
