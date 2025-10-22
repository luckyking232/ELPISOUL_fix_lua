require("ActivityDungeon1014_PlotByName")

function GetActivityDungeon1014_PlotWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1014_PlotUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
