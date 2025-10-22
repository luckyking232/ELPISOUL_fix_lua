require("ActivityDungeon1003_MiniMain_IntegralByName")

function GetActivityDungeon1003_MiniMain_TopUis(ui)
  local uis = {}
  uis.Integral = GetActivityDungeon1003_MiniMain_IntegralUis(ui:GetChild("Integral"))
  uis.root = ui
  return uis
end
