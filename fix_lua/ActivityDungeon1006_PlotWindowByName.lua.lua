require("ActivityDungeon1006_PlotByName")

function GetActivityDungeon1006_PlotWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1006_PlotUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
