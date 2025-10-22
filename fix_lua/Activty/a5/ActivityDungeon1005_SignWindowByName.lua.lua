require("ActivityDungeon1005_SignByName")

function GetActivityDungeon1005_SignWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1005_SignUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
