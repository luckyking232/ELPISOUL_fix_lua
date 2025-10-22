require("ActivityDungeon1004_PlotByName")

function GetActivityDungeon1004_PlotWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1004_PlotUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
