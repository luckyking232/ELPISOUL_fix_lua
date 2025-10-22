require("ActivityDungeon1022_SignByName")

function GetActivityDungeon1022_SignWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1022_SignUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
