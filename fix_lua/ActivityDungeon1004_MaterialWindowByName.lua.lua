require("ActivityDungeon1004_MaterialByName")

function GetActivityDungeon1004_MaterialWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1004_MaterialUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
