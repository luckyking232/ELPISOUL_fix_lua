require("ActivityDungeon1003_MaterialByName")

function GetActivityDungeon1003_MaterialWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1003_MaterialUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
