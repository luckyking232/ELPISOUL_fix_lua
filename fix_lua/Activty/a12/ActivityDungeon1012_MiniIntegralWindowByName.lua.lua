require("ActivityDungeon1012_MiniIntegralByName")

function GetActivityDungeon1012_MiniIntegralWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1012_MiniIntegralUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
