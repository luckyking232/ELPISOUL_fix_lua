require("ActivityDungeon1010_BuyLevelDes2ByName")

function GetActivityDungeon1010_BuyLevelDesWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1010_BuyLevelDes2Uis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
