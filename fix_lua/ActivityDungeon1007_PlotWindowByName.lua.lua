require("ActivityDungeon1007_PlotByName")

function GetActivityDungeon1007_PlotWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1007_PlotUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
