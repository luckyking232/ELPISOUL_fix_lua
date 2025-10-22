require("ActivityDungeon1015_MaterialByName")

function GetActivityDungeon1015_MaterialWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1015_MaterialUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
