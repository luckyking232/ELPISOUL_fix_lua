require("ActivityDungeon1020_MaterialByName")

function GetActivityDungeon1020_MaterialWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1020_MaterialUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
