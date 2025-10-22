require("ActivityDungeon1015_MiniMain_IntegralByName")

function GetActivityDungeon1015_MiniMain_TopUis(ui)
  local uis = {}
  uis.Integral = GetActivityDungeon1015_MiniMain_IntegralUis(ui:GetChild("Integral"))
  uis.root = ui
  return uis
end
