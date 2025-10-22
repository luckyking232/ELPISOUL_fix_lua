require("ActivityDungeon1013_MaterialByName")

function GetActivityDungeon1013_MaterialWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1013_MaterialUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
