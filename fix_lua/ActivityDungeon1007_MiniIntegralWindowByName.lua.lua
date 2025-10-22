require("ActivityDungeon1007_MiniIntegralByName")

function GetActivityDungeon1007_MiniIntegralWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1007_MiniIntegralUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
