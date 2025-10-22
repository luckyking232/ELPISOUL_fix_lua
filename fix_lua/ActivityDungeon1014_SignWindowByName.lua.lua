require("ActivityDungeon1014_SignByName")

function GetActivityDungeon1014_SignWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1014_SignUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
