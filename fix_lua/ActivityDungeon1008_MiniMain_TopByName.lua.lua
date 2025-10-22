require("ActivityDungeon1008_MiniMain_IntegralByName")

function GetActivityDungeon1008_MiniMain_TopUis(ui)
  local uis = {}
  uis.Integral = GetActivityDungeon1008_MiniMain_IntegralUis(ui:GetChild("Integral"))
  uis.root = ui
  return uis
end
