require("ActivityDungeon1012_PlotByName")

function GetActivityDungeon1012_PlotWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1012_PlotUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
