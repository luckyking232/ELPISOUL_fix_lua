require("ActivityDungeon1017_PlotByName")

function GetActivityDungeon1017_PlotWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1017_PlotUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
