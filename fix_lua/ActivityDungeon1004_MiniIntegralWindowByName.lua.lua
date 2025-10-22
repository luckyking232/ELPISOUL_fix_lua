require("ActivityDungeon1004_MiniIntegralByName")

function GetActivityDungeon1004_MiniIntegralWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1004_MiniIntegralUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
