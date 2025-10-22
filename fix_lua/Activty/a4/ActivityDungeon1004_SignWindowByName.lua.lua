require("ActivityDungeon1004_SignByName")

function GetActivityDungeon1004_SignWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1004_SignUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
