require("ActivityDungeon1010_PlotByName")

function GetActivityDungeon1010_PlotWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1010_PlotUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
