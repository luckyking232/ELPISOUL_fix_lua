require("ActivityDungeon1019_MiniMain_IntegralByName")

function GetActivityDungeon1019_MiniMain_TopUis(ui)
  local uis = {}
  uis.Integral = GetActivityDungeon1019_MiniMain_IntegralUis(ui:GetChild("Integral"))
  uis.root = ui
  return uis
end
