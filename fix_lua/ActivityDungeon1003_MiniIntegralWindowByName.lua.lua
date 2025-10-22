require("ActivityDungeon1003_MiniIntegralByName")

function GetActivityDungeon1003_MiniIntegralWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1003_MiniIntegralUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
