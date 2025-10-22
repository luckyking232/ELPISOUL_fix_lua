require("ActivityDungeon1010_MiniMain_IntegralByName")

function GetActivityDungeon1010_MiniMain_TopUis(ui)
  local uis = {}
  uis.Integral = GetActivityDungeon1010_MiniMain_IntegralUis(ui:GetChild("Integral"))
  uis.root = ui
  return uis
end
