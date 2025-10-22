require("ActivityDungeon1010_SignByName")

function GetActivityDungeon1010_SignWindowUis(ui)
  local uis = {}
  uis.Main = GetActivityDungeon1010_SignUis(ui:GetChild("Main"))
  uis.root = ui
  return uis
end
