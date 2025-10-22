require("ActivityDungeon1005_MiniIntegralByName")

function GetActivityDungeon1005_MiniIntegralWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1005_MiniIntegralUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
