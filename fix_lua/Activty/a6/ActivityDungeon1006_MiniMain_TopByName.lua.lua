require("ActivityDungeon1006_MiniMain_IntegralByName")

function GetActivityDungeon1006_MiniMain_TopUis(ui)
  local uis = {}
  uis.Integral = GetActivityDungeon1006_MiniMain_IntegralUis(ui:GetChild("Integral"))
  uis.root = ui
  return uis
end
