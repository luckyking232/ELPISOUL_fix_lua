require("ActivityDungeon1019_MaterialByName")

function GetActivityDungeon1019_MaterialWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1019_MaterialUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
