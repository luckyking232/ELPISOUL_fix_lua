require("ActivityDungeon1021_PlotByName")

function GetActivityDungeon1021_PlotWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1021_PlotUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
