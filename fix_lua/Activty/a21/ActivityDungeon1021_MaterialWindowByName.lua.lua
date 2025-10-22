require("ActivityDungeon1021_MaterialByName")

function GetActivityDungeon1021_MaterialWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1021_MaterialUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
