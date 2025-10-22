require("ActivityDungeon1007_BuyLevelDes2ByName")

function GetActivityDungeon1007_BuyLevelDesWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1007_BuyLevelDes2Uis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
