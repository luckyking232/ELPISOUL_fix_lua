require("ActivityDungeon1019_PlotByName")

function GetActivityDungeon1019_PlotWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1019_PlotUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
