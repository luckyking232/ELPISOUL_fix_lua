require("ActivityDungeon1005_PlotByName")

function GetActivityDungeon1005_PlotWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1005_PlotUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
