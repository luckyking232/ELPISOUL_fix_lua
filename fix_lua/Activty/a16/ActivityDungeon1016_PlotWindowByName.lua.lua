require("ActivityDungeon1016_PlotByName")

function GetActivityDungeon1016_PlotWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1016_PlotUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
