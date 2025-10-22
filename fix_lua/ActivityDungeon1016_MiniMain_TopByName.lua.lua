require("ActivityDungeon1016_MiniMain_IntegralByName")

function GetActivityDungeon1016_MiniMain_TopUis(ui)
  local uis = {}
  uis.Integral = GetActivityDungeon1016_MiniMain_IntegralUis(ui:GetChild("Integral"))
  uis.root = ui
  return uis
end
