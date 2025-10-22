require("ActivityDungeon1011_MaterialByName")

function GetActivityDungeon1011_MaterialWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1011_MaterialUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
