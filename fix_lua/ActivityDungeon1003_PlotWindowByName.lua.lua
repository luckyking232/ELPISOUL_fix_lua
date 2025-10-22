require("ActivityDungeon1003_PlotByName")

function GetActivityDungeon1003_PlotWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1003_PlotUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
