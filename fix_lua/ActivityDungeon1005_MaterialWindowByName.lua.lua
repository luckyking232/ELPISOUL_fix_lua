require("ActivityDungeon1005_MaterialByName")

function GetActivityDungeon1005_MaterialWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1005_MaterialUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
