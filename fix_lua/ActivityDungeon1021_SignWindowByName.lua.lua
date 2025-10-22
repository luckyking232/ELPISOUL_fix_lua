require("ActivityDungeon1021_SignByName")

function GetActivityDungeon1021_SignWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1021_SignUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
