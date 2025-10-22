require("ActivityDungeon1004_MiniMain_IntegralByName")

function GetActivityDungeon1004_MiniMain_TopUis(ui)
  local uis = {}
  uis.Integral = GetActivityDungeon1004_MiniMain_IntegralUis(ui:GetChild("Integral"))
  uis.root = ui
  return uis
end
