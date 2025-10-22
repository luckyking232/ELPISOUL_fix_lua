require("ActivityDungeon1003_SignByName")

function GetActivityDungeon1003_SignWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1003_SignUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
