require("ActivityDungeon1018_MiniMain_IntegralByName")

function GetActivityDungeon1018_MiniMain_TopUis(ui)
  local uis = {}
  uis.Integral = GetActivityDungeon1018_MiniMain_IntegralUis(ui:GetChild("Integral"))
  uis.root = ui
  return uis
end
