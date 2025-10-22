require("ActivityDungeon1010_MaterialByName")

function GetActivityDungeon1010_MaterialWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1010_MaterialUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
