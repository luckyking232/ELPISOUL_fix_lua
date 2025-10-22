require("ActivityDungeon1020_SignByName")

function GetActivityDungeon1020_SignWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1020_SignUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
