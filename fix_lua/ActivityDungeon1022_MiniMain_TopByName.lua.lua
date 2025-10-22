require("ActivityDungeon1022_MiniMain_IntegralByName")

function GetActivityDungeon1022_MiniMain_TopUis(ui)
  local uis = {}
  uis.Integral = GetActivityDungeon1022_MiniMain_IntegralUis(ui:GetChild("Integral"))
  uis.root = ui
  return uis
end
