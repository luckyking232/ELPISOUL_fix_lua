require("ActivityDungeon1016_SignByName")

function GetActivityDungeon1016_SignWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1016_SignUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
