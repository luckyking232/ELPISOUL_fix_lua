require("ActivityDungeon1008_MaterialByName")

function GetActivityDungeon1008_MaterialWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1008_MaterialUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
