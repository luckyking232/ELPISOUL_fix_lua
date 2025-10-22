require("ActivityDungeon1014_MaterialByName")

function GetActivityDungeon1014_MaterialWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1014_MaterialUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
