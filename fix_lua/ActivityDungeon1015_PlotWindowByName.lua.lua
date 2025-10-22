require("ActivityDungeon1015_PlotByName")

function GetActivityDungeon1015_PlotWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1015_PlotUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
