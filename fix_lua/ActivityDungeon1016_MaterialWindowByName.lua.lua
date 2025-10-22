require("ActivityDungeon1016_MaterialByName")

function GetActivityDungeon1016_MaterialWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1016_MaterialUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
