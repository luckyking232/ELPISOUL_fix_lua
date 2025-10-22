require("ActivityDungeon1008_PlotByName")

function GetActivityDungeon1008_PlotWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1008_PlotUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
