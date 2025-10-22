require("ActivityDungeon1017_MiniMain2_IntegralByName")

function GetActivityDungeon1017_MiniMain2_TopUis(ui)
  local uis = {}
  uis.Integral = GetActivityDungeon1017_MiniMain2_IntegralUis(ui:GetChild("Integral"))
  uis.root = ui
  return uis
end
