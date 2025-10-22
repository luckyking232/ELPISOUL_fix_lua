require("ActivityDungeon1017_BuyLevelDes2ByName")

function GetActivityDungeon1017_BuyLevelDesWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1017_BuyLevelDes2Uis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
