require("ActivityDungeon1006_BuyLevelDes2ByName")

function GetActivityDungeon1006_BuyLevelDesWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1006_BuyLevelDes2Uis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
