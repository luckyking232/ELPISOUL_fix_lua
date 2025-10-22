require("ActivityDungeon1007_MaterialByName")

function GetActivityDungeon1007_MaterialWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1007_MaterialUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
