require("ActivityDungeon1011_PlotByName")

function GetActivityDungeon1011_PlotWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1011_PlotUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
