require("ActivityDungeon1006_MiniIntegralByName")

function GetActivityDungeon1006_MiniIntegralWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1006_MiniIntegralUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
