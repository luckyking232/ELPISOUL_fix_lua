require("ActivityDungeon1005_MiniMain_IntegralByName")

function GetActivityDungeon1005_MiniMain_TopUis(ui)
  local uis = {}
  uis.Integral = GetActivityDungeon1005_MiniMain_IntegralUis(ui:GetChild("Integral"))
  uis.root = ui
  return uis
end
