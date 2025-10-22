require("ActivityDungeon1006_MaterialByName")

function GetActivityDungeon1006_MaterialWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1006_MaterialUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
