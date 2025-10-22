require("ActivityDungeon1017_MaterialByName")

function GetActivityDungeon1017_MaterialWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1017_MaterialUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
