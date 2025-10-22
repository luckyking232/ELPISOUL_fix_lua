require("ActivityDungeon1008_MiniIntegralByName")

function GetActivityDungeon1008_MiniIntegralWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1008_MiniIntegralUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
