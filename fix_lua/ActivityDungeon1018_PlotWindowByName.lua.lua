require("ActivityDungeon1018_PlotByName")

function GetActivityDungeon1018_PlotWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1018_PlotUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
