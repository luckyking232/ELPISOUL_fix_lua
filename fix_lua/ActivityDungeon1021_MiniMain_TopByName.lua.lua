require("ActivityDungeon1021_MiniMain_IntegralByName")

function GetActivityDungeon1021_MiniMain_TopUis(ui)
  local uis = {}
  uis.Integral = GetActivityDungeon1021_MiniMain_IntegralUis(ui:GetChild("Integral"))
  uis.root = ui
  return uis
end
