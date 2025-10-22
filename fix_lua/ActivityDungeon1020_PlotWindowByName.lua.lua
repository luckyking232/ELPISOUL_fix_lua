require("ActivityDungeon1020_PlotByName")

function GetActivityDungeon1020_PlotWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1020_PlotUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
