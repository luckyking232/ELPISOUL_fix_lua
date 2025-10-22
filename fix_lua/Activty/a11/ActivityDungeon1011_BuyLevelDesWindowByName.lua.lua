require("ActivityDungeon1011_BuyLevelDes2ByName")

function GetActivityDungeon1011_BuyLevelDesWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1011_BuyLevelDes2Uis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
