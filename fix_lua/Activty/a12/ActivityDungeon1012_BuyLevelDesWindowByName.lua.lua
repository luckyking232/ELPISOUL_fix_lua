require("ActivityDungeon1012_BuyLevelDes2ByName")

function GetActivityDungeon1012_BuyLevelDesWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1012_BuyLevelDes2Uis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
