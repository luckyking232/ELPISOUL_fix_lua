require("ActivityDungeon1018_MaterialByName")

function GetActivityDungeon1018_MaterialWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1018_MaterialUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
