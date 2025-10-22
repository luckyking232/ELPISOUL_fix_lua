require("ActivityDungeon1007_MiniMain_IntegralByName")

function GetActivityDungeon1007_MiniMain_TopUis(ui)
  local uis = {}
  uis.Integral = GetActivityDungeon1007_MiniMain_IntegralUis(ui:GetChild("Integral"))
  uis.root = ui
  return uis
end
