require("ActivityDungeon1015_SignByName")

function GetActivityDungeon1015_SignWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1015_SignUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
