require("ActivityDungeon1006_SignByName")

function GetActivityDungeon1006_SignWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1006_SignUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
