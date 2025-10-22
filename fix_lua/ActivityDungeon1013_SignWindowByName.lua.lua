require("ActivityDungeon1013_SignByName")

function GetActivityDungeon1013_SignWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1013_SignUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
