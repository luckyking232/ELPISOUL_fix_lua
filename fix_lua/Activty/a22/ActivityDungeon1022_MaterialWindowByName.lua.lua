require("ActivityDungeon1022_MaterialByName")

function GetActivityDungeon1022_MaterialWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1022_MaterialUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
