require("ActivityDungeon1011_MiniMain_IntegralByName")

function GetActivityDungeon1011_MiniMain_TopUis(ui)
  local uis = {}
  uis.Integral = GetActivityDungeon1011_MiniMain_IntegralUis(ui:GetChild("Integral"))
  uis.root = ui
  return uis
end
