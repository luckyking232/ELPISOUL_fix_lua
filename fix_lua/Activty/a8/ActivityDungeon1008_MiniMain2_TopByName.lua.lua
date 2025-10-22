require("ActivityDungeon1008_MiniMain2_IntegralByName")

function GetActivityDungeon1008_MiniMain2_TopUis(ui)
  local uis = {}
  uis.Integral = GetActivityDungeon1008_MiniMain2_IntegralUis(ui:GetChild("Integral"))
  uis.root = ui
  return uis
end
