require("ActivityDungeon1022_PlotByName")

function GetActivityDungeon1022_PlotWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1022_PlotUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
