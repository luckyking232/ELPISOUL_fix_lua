require("ActivityDungeon1019_SignByName")

function GetActivityDungeon1019_SignWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1019_SignUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
