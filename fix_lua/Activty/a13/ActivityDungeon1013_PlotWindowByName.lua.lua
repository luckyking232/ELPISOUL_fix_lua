require("ActivityDungeon1013_PlotByName")

function GetActivityDungeon1013_PlotWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1013_PlotUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
