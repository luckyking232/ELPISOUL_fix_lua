require("ActivityDungeon1015_BuyLevelDes2ByName")

function GetActivityDungeon1015_BuyLevelDesWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1015_BuyLevelDes2Uis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
