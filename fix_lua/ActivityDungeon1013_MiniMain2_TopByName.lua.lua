require("ActivityDungeon1013_MiniMain2_IntegralByName")

function GetActivityDungeon1013_MiniMain2_TopUis(ui)
  local uis = {}
  uis.Integral = GetActivityDungeon1013_MiniMain2_IntegralUis(ui:GetChild("Integral"))
  uis.root = ui
  return uis
end
