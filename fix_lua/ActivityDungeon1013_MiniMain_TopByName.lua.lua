require("ActivityDungeon1013_MiniMain_IntegralByName")

function GetActivityDungeon1013_MiniMain_TopUis(ui)
  local uis = {}
  uis.Integral = GetActivityDungeon1013_MiniMain_IntegralUis(ui:GetChild("Integral"))
  uis.root = ui
  return uis
end
