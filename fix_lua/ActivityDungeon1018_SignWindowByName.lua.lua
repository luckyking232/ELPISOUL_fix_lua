require("ActivityDungeon1018_SignByName")

function GetActivityDungeon1018_SignWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1018_SignUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
