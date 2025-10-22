require("ActivityDungeon1012_MaterialByName")

function GetActivityDungeon1012_MaterialWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1012_MaterialUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
