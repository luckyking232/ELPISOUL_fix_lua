require("ActivityDungeon1022_BuyLevelDes2ByName")

function GetActivityDungeon1022_BuyLevelDesWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1022_BuyLevelDes2Uis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
